Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5DC4A49AB
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461919; cv=none; b=pzleggnmRlHRviFbN4eo887fHexIOThXfTsKe3iVzxl8ZELQx6qgYUJmy3awBvDaIJ9FeWBbhsOZWFTNkMz8D0wnDdBh/908SReJNBwOmEmQM9rc0NZEltelh1WpLkD1GPthKwCwxWJOXnV6fnpGPhfbcdDYXRKTq6wJss7ucsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461919; c=relaxed/simple;
	bh=PEaLbwzOb+goHFxNAABOoR1EIpCElqjGmfdmvML+pNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/yAZtxu8VZ1Z5ReeuyLL9r8UpfZlOo0zytd25UYE39xnvAS2J1XTOAWsdB4gbxQbSb4tNwWM5CZmD71rtG1daEgGE1tqCF+1a7a6fU5AMUqf3+YvSTrsTcfIVZojcXcBTnN2UZfxSj8RHXNRe/UV5UneBZ67iWjkzVw6+65nNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYo+GaH0; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYo+GaH0"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso2859365a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461917; x=1790066717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/ckj+sOUQ60JwxbsOeTuwnrHwCCAW2BGcG7Qvw4jxg=;
        b=QYo+GaH0TNkXinamNHfXifdyeiKvHjS88dn9R6zyyVtlARsWjdBjm1ADWlcsCW8+9p
         LPk3efg8iTK11g97oiPk/TailQJ2wqIP5hehbl33Dz76ITHHB9CCKY4tGhjyoABnl7O+
         kWOQdaad8RtTpUd1qDw+9AWO8IORMrPZLmT0PbP5y6Mh4p4O08ZWUJ6/eXZlB5nfuX1K
         gqS2pNieCPY7S3BvWx3DS7AIXY/q7Aqn6k8dkYp77ceKJPw7OScMvpq6c+qA/ZBUpXtj
         vOXebjV18X2xpYsLNKFMewuTeWthXMWr6sHcxIXjqpIhaDeRn1wZVL3uJOXaV1IQxBRg
         644Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461917; x=1790066717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/ckj+sOUQ60JwxbsOeTuwnrHwCCAW2BGcG7Qvw4jxg=;
        b=lr0nz4Jh6jwPYDx1c1pUj/vjz761jYef/NsfwiCMetaQlBLFttf9T36xf4IW39jBB1
         g6hTVqg9XhVI0X8RkZmb9UJewHL5M2gm8/v3FlkqhZVKMkT7b9fcIb9fLoOj5HFcd1d+
         htTzHmUEBES/+cMS+GXun/Oet7UV4MLv8huicWpLw+AqptW1CdKpb0dP1vKJZlK+TVRG
         GGeGv5g3ynqLnUeXCbu2WoNHzD7RxrtrLIaXEFXER8KJSEu+XvxV59fCXfmC7cEnZQHw
         KsvzahmxYEKvCRBpsJO+Ou+uWP3WHqlthjj42dQwtO7Q1YP6RpFHRuim/3jyPuPp9p1b
         tFJQ==
X-Gm-Message-State: AFuF++k1CSS6kKGjWjb58smKQuemRYRbjixah4IooLymUSYR41uQl/XG
	e8rd+zONluCwaTLJUxFYTplSmc0k7bgMtIwKGEMgLxLyTRMT7JvHmhBF
X-Gm-Gg: AYBFou3Fp6V0TsjjZ66lsgL/ymRAZRccnkL1xQF/hJUCvFosMDniadqV2Ni7VuP8I/R
	qbNjBa7f5p+u0jtgw9xSnW/HyUlD1IOQcYGnDPfMN7yJa4I2TdHFOVJGJPZT8/kTRKUocpbsNsI
	hjDfzyb/yYkugnpYmkt253B5YF+PtxULBSpfaOoLm91DnIYWvFA49SzNiqdB83Lzsiiw1X5Gp3K
	F35oxpVuK10EtXh1XkGwNW1eJYJSUtqa848xPyzwoadqDHuMABMd0zlWCyLrBXnuJew926yXAYi
	xWwAbwsMKFGotV/S+e5i/MrLfUhIT8veIgmULj29qXbgpePfxIgl8G2Dyz8qtjPXOdZQ8b/3rau
	+OSH2xf07+E8K7eDlowHUby0iUWrRwDXM7XoGA4wZUwuNqE12/O8uqRD8loQEnEJ8QlixxBk7w6
	i7tk+iV4loyrGR10wt1lPNbGHu+PpR2hT5aNSfjsCEdoVZTXXHgPs2gVMHWzSCi+7GN9NDkLORD
	GwIEErvIgNfwq2VRuaib+6Y9w==
X-Received: by 2002:a05:6a21:1518:b0:3d0:88f5:f806 with SMTP id adf61e73a8af0-3db40521dc6mr13468678637.15.1789461917459;
        Tue, 15 Sep 2026 01:45:17 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:17 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 17/23] ALSA: lx6464es: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:18 +0530
Message-ID: <20260915084424.1007757-18-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/lx6464es/lx_core.c | 2 +-
 sound/pci/lx6464es/lx_defs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index 9909f1067871..ae265dd19333 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -364,7 +364,7 @@ int lx_dsp_get_mac(struct lx6464es *chip)
 	macmsb = lx_dsp_reg_read(chip, eReg_ADMACESMSB) & 0x00FFFFFF;
 	maclsb = lx_dsp_reg_read(chip, eReg_ADMACESLSB) & 0x00FFFFFF;
 
-	/* todo: endianess handling */
+	/* todo: endianness handling */
 	chip->mac_address[5] = ((u8 *)(&maclsb))[0];
 	chip->mac_address[4] = ((u8 *)(&maclsb))[1];
 	chip->mac_address[3] = ((u8 *)(&maclsb))[2];
diff --git a/sound/pci/lx6464es/lx_defs.h b/sound/pci/lx6464es/lx_defs.h
index eca5367ba561..89e433d3f7a2 100644
--- a/sound/pci/lx6464es/lx_defs.h
+++ b/sound/pci/lx6464es/lx_defs.h
@@ -315,7 +315,7 @@ enum stream_flags {
 #define ED_XILINX_ERROR                 (ED_RT | 0x07)
 #define ED_COBRANET_ITF_NOT_RESPONDING  (ED_RT | 0x08)
 
-/* Complete BOARD error code for the invaid standard object class */
+/* Complete BOARD error code for the invalid standard object class */
 #define EB_ISO          (ERROR_VALUE | E_SOURCE_BOARD | \
 			 E_CLASS_INVALID_STD_OBJECT)
 #define EB_INVALID_EFFECT               (EB_ISO | 0x00)
-- 
2.48.1

