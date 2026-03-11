Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0091320A0E;
	Wed, 11 Mar 2026 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250890; cv=none; b=f8Ph65HtLbcz946C6SYm8LpKDvgcnSn+EG++dsC2RaiM5HQ4TyFIy0OmyLKVqrWuUJBzaNhe4eUE0GRFrO4XpqeiRBwLADHXcXmClkHkUgjxwvenS2RtRkNBCtsxXlJm89ZFEkXc7ytLMN6snPsPFQ+GwKsjbz73G9Yd0hSpCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250890; c=relaxed/simple;
	bh=cX5ESfCJvyVGOODl3srE54xQHPtwOiy0scqj14sWOPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FxZcFM9T/oCkCZrZMAwCiQmusuEhgT3YGunz9HhZAgjayRFNR+Gcs+WN8Ey303TwZ/tSg+frLn0bpv+vvEk1rG923IfieubRpw7DOhhfmGALtmpgtHya1Fi9PRLdF3GkPUZdeNIpfO+MDeGXEv0NbwcCRMVaa/ofClg/Q+yZD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuGyTH5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuGyTH5C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E7A1C4CEF7;
	Wed, 11 Mar 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773250890;
	bh=cX5ESfCJvyVGOODl3srE54xQHPtwOiy0scqj14sWOPc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NuGyTH5Ciy/kTVCDmlIWH8Vw82e+kip2/jcdBhkCz8hGUar6QzcZJvfc3FSdkXdGR
	 D+/Xk/zmsYl0xyeeJokCBZ1iba/Ivh9QuS+uBGaIMHgHzUujzGdTnc8uDoO6aDj1sD
	 zoErqgaWCAuaIuJfywcAxLDG9Th8OdiJq0sZOLJQ2KC+gy5RSkqZwYimhIDKZsFO5t
	 r7k5EHmD1GMhByISKoS5AxjBvuvywX1KIBu2dK7cNku8PeRGdWmD5vTj5ct3MrkyGt
	 BVtzS8UwuQx1OPtX7IRWBmYQax3SuRYsEKkLlhNQx7gYFs4bx61bR0GZlShFE4/Fm9
	 nXZGIahfm1rtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224351125811;
	Wed, 11 Mar 2026 17:41:30 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 11 Mar 2026 12:41:20 -0500
Subject: [PATCH v2] ASoC: codecs: aw88166: Support device specific firmware
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-aw88166-fw-v2-1-8ef30dae3657@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Myw6CMBCF4Vchs3ZML3GKrnwPw6LFFiYRMK0pG
 tJ3t7J2+Z/kfBskH9knuDQbRJ858TLXUIcG+tHOg0e+1wYlFAktBdq1bSURhhXPQrtAxgtSEur
 hGX3g947dutojp9cSP7ud5W/9y2SJApUx5kTaOTL6OkyWH8d+maArpXwB1Wh++qQAAAA=
X-Change-ID: 20260310-aw88166-fw-903bf67e0621
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773250889; l=2810;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=PSKCEBezeNkHEqW++qztKOJQazmNiZFBnmyGWtD8itQ=;
 b=ibbTDxi0MgSmlUbX182R8yJdaTgUWglLz7WRAAGGjITToHASWxtBnJxJDRrJTgFk3WhlO3JWV
 uIkEA2vrTEuAHSLZPcg4SHnTfEa48J/1kj8nrYq2EL6ZHeIaK73Wixn
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Teguh Sobirin <teguh@sobir.in>

This driver currently loads firmware from a hardcoded path. Support
loading device specific firmware when provided by the boot firmware.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
The driver currently loads a hardcoded firmware path. This adds support
for reading a device specific path from the kernel device tree.

The patch was originally part of a larger change [0] by Teguh Sobirin
and was cut down to only the device specific firmware part.

[0] https://github.com/AYNTechnologies/linux/commit/9dbdd074423d970a9dec9a60f8bb99f8cfafd6a1
---
Changes in v2:
- Rebase on current linux-next and drop the duplicated bindings patch
- Change Co-authored-by tag to Co-developed-by
- Drop unrelated of_match_table addition
- Link to v1: https://lore.kernel.org/r/20260310-aw88166-fw-v1-0-2777563bb673@gmail.com
---
 sound/soc/codecs/aw88166.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index daee4de9e3b01fb335975a65456cc79575533d7e..ea277a940c44dfbf033ed4a69051bf506252b1c8 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1574,18 +1574,22 @@ static int aw88166_dev_init(struct aw88166 *aw88166, struct aw_container *aw_cfg
 static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 {
 	const struct firmware *cont = NULL;
+	const char *fw_name;
 	int ret;
 
 	aw88166->aw_pa->fw_status = AW88166_DEV_FW_FAILED;
 
-	ret = request_firmware(&cont, AW88166_ACF_FILE, aw88166->aw_pa->dev);
+	if (device_property_read_string(aw88166->aw_pa->dev, "firmware-name", &fw_name) < 0)
+		fw_name = AW88166_ACF_FILE;
+
+	ret = request_firmware(&cont, fw_name, aw88166->aw_pa->dev);
 	if (ret) {
-		dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", AW88166_ACF_FILE);
+		dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", fw_name);
 		return ret;
 	}
 
 	dev_dbg(aw88166->aw_pa->dev, "loaded %s - size: %zu\n",
-			AW88166_ACF_FILE, cont ? cont->size : 0);
+			fw_name, cont ? cont->size : 0);
 
 	aw88166->aw_cfg = devm_kzalloc(aw88166->aw_pa->dev,
 			struct_size(aw88166->aw_cfg, data, cont->size), GFP_KERNEL);
@@ -1599,7 +1603,7 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 
 	ret = aw88395_dev_load_acf_check(aw88166->aw_pa, aw88166->aw_cfg);
 	if (ret) {
-		dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", AW88166_ACF_FILE);
+		dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", fw_name);
 		return ret;
 	}
 

---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260310-aw88166-fw-903bf67e0621

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


