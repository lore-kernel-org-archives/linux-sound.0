Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B62D7DD2
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540946; cv=none; b=kxXor4wrCLFL9W4MWTmIJ17V3nDYq3ZJR5ZzcAKPBllb7WJy/DAAB3+8JCs3l7CJBfLsejigeSAPtaD0o+5LqDRBaNIM4u1LNK2O1oaPwHaKfD055bFlrAOutnLkzxP8RlcfejglcwAR44OzRard7KaN/aX47jwksu/T0iv1zbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540946; c=relaxed/simple;
	bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K88zBf62dT80E05UwVgMhA0REg4TGdnZ0158W4eR5EwWjw3pXeWW4FXlVf1U20oaucJHTrmaxKhN3+wRDXunUGWPb3whIuc53xe9so/klanuH9ww2dxtoqGxNkd8zT2aoKfGch7rn/0ZhqXrt0fzo9F+zLiI/+iqzFl5vvjbEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtC9lN+s; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtC9lN+s"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so1078275e9.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 11:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540926; x=1770145726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=AtC9lN+sHsLqm03PvmDYsqVXoRYXbokVERW+B2u7LEZTy6X2WAylbngBnHdARIOtuF
         gaYwl0ayGp61uRZNiUAn299pmOXuF5yjFCCQzofxOjCyrfD9gN3K2U2xD6qaBz1BVt6N
         o503+sFHsfhSKCmj5yUZMbsJUKGIg82K7sguimoMx+ow6yPq7I2F+tQqdKGSLgIfilni
         zJTK2nol/amS/bZD8UdaOm1OR6IljlRVT9AEhp8IKBVTN+SE+Cw3sXEmS5BY51dcx3ct
         gBsMx+y1mts2foG1qUI0p/IEDtdpWlCHBwRA71fbBnmShGXT6MB3x2RIRouwvz7mobXl
         vVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540926; x=1770145726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=VJKSGqEB7DSIJBLZR6TaMAXqhS/BdzMhF3YDOt9/Der/ykiRgOETkF3hNVov56VgVI
         zrBVmdDYkrA45/L8u7hAf33SCBiUZlXNFEEQSLz9vF7fXzJkB8Mvs9ORW0xugDxeCQ5y
         1eOMehj3+wVNOVvFPWXhBoIBnJeuonuw75a/xONGHv3qpQ2vicRetTWWiv4iZMYDzEEx
         LJT99hzhWoa9/OVw4lA+GCe/vEEh9cOj+4ZZw0BsORrCNBF6VhYUxcDS/MOtWT6ZbK2t
         dniNeZVlGTXXbEEmEEZLZK/NXA06oJyMQxSFJ31HMvpM3WGLSQjmWxl+p1ksPnfSuivJ
         Ad1g==
X-Gm-Message-State: AOJu0Ywa1WoMt1PNfb61ctzYL3d6wCVngnqjeMJqBny44i0kuxMG3l97
	/f+s6b2K5oCP5ko1GeUPWZEIm12MmoOLAjE7YS4fZUF9qypMsRcuZxgU
X-Gm-Gg: AZuq6aLJvFBuYauXID+ZoZgCslLIdHxWHL5FbdxY/c7Z3LPkCLu7zzykA2hcTxnnnuk
	LVvcUDf04TQtZPyIyWm73ux4w8tAvxSrdsMXNnvhP+aYIxyHzgEQ8jSkwEdI5t7W8xmSZx18RRH
	ifNYBqqaso9VlX2jMXZ/93XZwxyyqBwBzQPn8w+SH0NQFdLKlkgkLeF9uuwLgxMtg/q19JRbTsU
	f8azgizncAQ0KKINa4u7BYAOpqZpedtAwC3npgtPUIJBJxV4Thbb0HiJGoAQxBd5Q2JjK16IXW8
	dbWWh7/excd363W/ASAD3yIj7ko9glf9tk2xhOYFFxFfu3eVflkdivbodRMbJN0rrebDGLRAJvl
	Dyleb0GV7cvfLM2+QygZ85MqKI50VNgG+Kexci86eNAKdTtJYJlQLLevSleiZqKU/M8wxJl7T94
	Cei+kHH3DDFzOkAX9B0vkA1CAb756q+T99PZkgprw/wC3n
X-Received: by 2002:a05:600c:33a6:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-48069e0fd24mr22092945e9.1.1769540926002;
        Tue, 27 Jan 2026 11:08:46 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:45 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 23:08:20 +0400
Subject: [PATCH v2 2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v2-2-5f66b841f63d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=698;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
 b=/rD5GXHuEV3Sch9Z9gONegfTboapMyzZ1kxLPbu0BxspfEG4J5ZGlb3BJaQZ1f5WUa+G/K3eS
 KFadRcvrmSsDhGovRx87GE3yJ9CT++kOJFN6LW4GVcq35PrmpLbd6BN
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Restore the empty line that was accidentally removed earlier

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index e4786f087589..9b454261bcfd 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
+
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc

-- 
2.43.0

