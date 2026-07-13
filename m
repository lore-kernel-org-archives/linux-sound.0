Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5263382F4;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973134; cv=none; b=XzGs+/Io5LHyhwKI486E13cuab4eZPdia5pZjCxHByuHxGAoqprPhZSdxY52+256EH1XpBXVQgO4XptL7fY3LuDiPp/CzZsD4wzB185XIFr0BYkcjhlSun82/T4ea+1E0iTuuZpEMtnA4UyGcBqYGfZShH6ktT1WSHfPh50kWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973134; c=relaxed/simple;
	bh=fVYR9QJBEwKy0AHnOeETfy4OqM5XjQ3p+9fHZbjJe2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DPaS9K6IYMwFrdapiVxfnpYmn21s8TxgZNAwI8n/CLMsEMgERGWPxIyooUK+Yy1LvbpcbRMlUi9TZ0U+0v2UjidK0apgyFYabLFsxpCZ2guKX5maENV7iV03h2bGAyGRahtDmkwKKeTE9rCpQyRPJXSO9IvLpIa3zhHqhXm2Ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KA0AUAbq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KA0AUAbq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82E7EC2BCB8;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783973133;
	bh=fVYR9QJBEwKy0AHnOeETfy4OqM5XjQ3p+9fHZbjJe2c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KA0AUAbqehdGAefH6vxjaTJ4tw3a6JHlNMzNesrYgczBhgouFJtLgfTTqylasHy7w
	 ldl/ClgPCmNITszfRRpqCDVp8+UM0atVOKWhIzw0VN6TuI14sVbmelJNtuXJHqcOgV
	 TsAGuOCI3JfIDC089l922dB+Zn4k+pAlkl5+39pGfAFqyB+tw05fphDnuSvMXPJ/V+
	 j0Fv30Lz3JhYmGY5SjFdcDz0GobRRZ9/1l7cOyC3AB1Zvh+16cDl02MFTNvhgtmg6G
	 BecCXonEk2l12QjnT/A5bvTgUkGJO8xV80YFRlk6iUFxIbBKDHuDlsJJmM1F5DQAUE
	 YbolyaoaIomAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0BBC43458;
	Mon, 13 Jul 2026 20:05:33 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/2] ASoC: Add LPASS VA CSR HeartBeat pulse clock support
Date: Tue, 14 Jul 2026 01:35:31 +0530
Message-Id: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtFVWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3dzE4pLUIt3kRAvzJNM0Q8vEVAMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0A+EPH3GoAAAA=
X-Change-ID: 20260714-master-ca87b5f19ae0
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783973132; l=1707;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=fVYR9QJBEwKy0AHnOeETfy4OqM5XjQ3p+9fHZbjJe2c=;
 b=9JTqpKCkIA9r1TRRXYOCDAnpAg+56prw6wYSJ1wEy6qGQbUgggaAGrMc2rM+JwgJypzeQKNnU
 6i+2roaa0/DC/fk/yeqIhvSTLLgjpbNEWi77ar+WnevuZ6+Ke2YeZsV
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

The LPASS VA CSR block contains rate generator hardware that produces
a HeartBeat Pulse (also known as RateGen Pulse). This pulse
synchronizes the start of the DMAs and Codec Interfaces for the audio
usecases and can serve as a periodic wakeup source for the DSP.

This series adds the DT binding and driver support to model this
rate generator as a clock provider, and extends the VA macro binding
with a new hawi variant that consumes the heartbeatpulse clock
alongside its existing mclk, macro, and dcodec clocks.

Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
clock provider node and extends qcom,lpass-va-macro to describe the
new qcom,hawi-lpass-va-macro compatible with its four-clock
constraint.

Patch 2 adds the lpass-va-csr driver that registers the
lpass_heartbeat_pulse clock and enables/disables the rate generator
via regmap when the clock consumer requests it.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Sarath Ganapathiraju (2):
      ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock
      ASoC: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/sound/qcom,lpass-va-csr.yaml          |  47 +++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  18 +++
 sound/soc/codecs/Kconfig                           |  13 ++
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/lpass-va-csr.c                    | 143 +++++++++++++++++++++
 5 files changed, 223 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260714-master-ca87b5f19ae0

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


