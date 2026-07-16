Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5E33260D;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231496; cv=none; b=XSrvACjOgTe9Rlk4ObSJEyvOk0WX4TPG7rN29DtdlRaOh8wmXULvsl3usPktXyoD/wt0OHH/wRkLeH7dWN2s8oztABwx5ZVmP+rUedp0HskCNF3aVAvnuN9Vc3DeL7weD1dfRS5xlYKv79luL2HDhaSzyA5/Q9ZA4hp2q18+LD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231496; c=relaxed/simple;
	bh=ynSdBnUoyOi6UoJHyE2audEAzW2KnJocKKBLbmP65Mw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L4PjauqS2J6F4CT/o2IcodCzrIegTzTwCHeqR5MJvcRSXERgp6y91SGCNMfVuEQXK58kxQ4tlBUA6n38D3LYsgo4DdjHRCIYiD9O63/q3NPGOtJ5sl7Rx4YNrocq6evh/sEScWJQptGcP2IaZowiOnwtMnVt6L7lwGTkmVTq80k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+kZvWj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+kZvWj2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 872D8C19425;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784231495;
	bh=ynSdBnUoyOi6UoJHyE2audEAzW2KnJocKKBLbmP65Mw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a+kZvWj2jZCixqdZZH9hd9cm1yHvB0r/EZmGECCx6tgut+ufkB7EjUbdSoXMKniU+
	 +NVyhOWfDHvox1eJWpAhWR6+R0rcNOoK6g+Nn2aYw5elot3ak6OxlCv1dvBPBtETXH
	 K+HZHcMoeAWJbHmdm00BxPjy+8mYUSmWaj95v9srweGO6uPBdDP/S4q/FCa8w+IF7i
	 jAZ/W7+Wn+RagwGi337iI9KOUCkqLvGO/EAbmlV4I7p/bf1FJwD6dwt5H/Sf0IuE20
	 v3MX5HrvrM/li6cWU6WEo7lhcQsjVnMz5btvtek+BWPjGTnJxQF5jCwWpTuIiTWhnC
	 LrOkrjwg3ha4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A89C44515;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/3] ASoC: Add LPASS VA CSR HeartBeat pulse clock
 support
Date: Fri, 17 Jul 2026 01:21:14 +0530
Message-Id: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADI2WWoC/2WNQQ6CMBREr0L+2pK2WhFW3sOwKPUjNUK1vzQa0
 rtbcOlmkpe8mVmA0FskaIoFPEZL1k0Z5K4AM+jphsxeM4Pk8sgrcWCjpoCeGX2qOtWLWiOHLD8
 99va9DV3aH9Pc3dGEtb0ag6Xg/Gd7imL1/kajYJwJ7FDV9V5KhWdHVL5m/TBuHMsc0KaUvp8h+
 pS1AAAA
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784231493; l=2757;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=ynSdBnUoyOi6UoJHyE2audEAzW2KnJocKKBLbmP65Mw=;
 b=/C9B8KGtU5uhM5nYZ8q0JSK6VGi0voUYFXylhkxYG7PmyAnR++MmiAvRTmbU+FD8dechEU4Ui
 na9TynqDWYFCdQhED+QUg25dI7mHPwyuaoFak7noES3RIqdTlve+LFj
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
clock provider node.

Patch 2 extends qcom,lpass-va-macro to describe the new
qcom,hawi-lpass-va-macro compatible with its four-clock constraint.

Patch 3 adds the lpass-va-csr driver that registers the
lpass_heartbeat_pulse clock and enables/disables the rate generator
via regmap when the clock consumer requests it.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Changes in v2:
- Split the DT binding patch into two: one for the new
  qcom,lpass-va-csr binding, one for the qcom,lpass-va-macro
  extension (Srinivas).
- Fixed the qcom,lpass-va-csr example so it uses a 2-cell reg
  under a proper #address-cells/#size-cells parent node, fixing
  dt_binding_check (Rob).
- Switched the heartbeatpulse clk_ops from atomic
  enable/disable/is_enabled to sleepable prepare/unprepare/is_prepared,
  since regmap with a maple tree cache is not safe to call from the
  raw spinlock context the atomic ops run under.
- Checked and propagated regmap_write()/regmap_read() return values
  instead of ignoring them.
- Used regmap_set_bits()/regmap_clear_bits()/regmap_test_bits() instead
  of manual regmap_update_bits()/regmap_read() combos (Konrad).
- Used lowercase hex for register offset defines (Konrad).
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com/

---
Sarath Ganapathiraju (3):
      ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock
      ASoC: dt-bindings: qcom,lpass-va-macro: Add hawi heartbeatpulse clock
      ASoC: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/sound/qcom,lpass-va-csr.yaml          |  52 ++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  18 +++
 sound/soc/codecs/Kconfig                           |  13 ++
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/lpass-va-csr.c                    | 143 +++++++++++++++++++++
 5 files changed, 228 insertions(+)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260714-master-ca87b5f19ae0

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


