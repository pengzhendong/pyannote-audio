// Copyright (c) 2022 Zhendong Peng (pzd17@tsinghua.org.cn)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef DIARIZATION_DIARIZATION_MODEL_H_
#define DIARIZATION_DIARIZATION_MODEL_H_

#include "diarization/onnx_model.h"

class DiarizationModel : public OnnxModel {
 public:
  DiarizationModel(const std::string& model_path);

  int num_speakers() { return num_speakers_; }

  void Forward(const std::vector<float>& data, std::vector<float>* posterior);

 private:
  int num_speakers_;
};

#endif  // DIARIZATION_DIARIZATION_MODEL_H_
