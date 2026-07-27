Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D13F4DE9
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145475; cv=none; b=CftyzSaNWbXCj3VcUIq7sK8sFvggaGdcgs2M7/+qy2Hun1cNyUcoXK5cbBqfWO3pPNam96llzzUUBb6J6s9wWuEax9LM6AxcIp4op2pl30H6wPzeBjnQCQTK8N4zCzd6yG6NRyDsQLWrSfaIotSh/WIbAp4DeKDXyvYbPPWWRDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145475; c=relaxed/simple;
	bh=2Uu6btblyzVE68osf0l6GSac+UXS2aaqwSOrufHLGkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0mtLfijC/1zLznAxrxMoLVYz2LAeXDSQM217GH6T6z/MDMP2KcJQ616+ZMPpyvZAuUWQXIKwGCghxkWedtaLONDQigWbQ/TT0V6GgHSUiBd0kyWHQ0HW2ZfHc0r1RKPAaVVbWVlfIFL44UMZA/Indvl09+w7UXqLwApvSSVODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqH19009; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqH19009"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1803578a12.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145473; x=1785750273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMgCZgk4Fdz3pUmY/mpab9MmOPoIRFM17hlBry5iTO0=;
        b=pqH19009qUF2e5Q76NSsh/mGszX9myawaMFWlwnYK0LoNjYmx1TFY2swZRdGkaDkHM
         +vIY8oPgSbwnccciKAnXmPRuphw93zHZI5bJsmFsz3c2gzDSTtSeCztuPNVIadR37rg+
         cfOKhS43ZSydnpd56b+FORqawu1kE7fHv45/CHXyOyoQQ6p0j30O+COcN7gzzxBbMIr9
         Js700wIcNbxt4HPI9DcM6jGpDi6o5JCb9nuhMh9d8lP+WRc7V1ISIzTS7TROWakdKpgR
         /V/Yw9Byu3QBmY/TY34A19OQ0qypdQLWYD09UIaZdAVKpOzWyyDtsKxPiShZFPHxPvpr
         zi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145473; x=1785750273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMgCZgk4Fdz3pUmY/mpab9MmOPoIRFM17hlBry5iTO0=;
        b=KuUNd8eTzUlu0lWxhHYryNxQlUjdbPz5NZ4ddf2SQIn9S/39d/isg3tRHJWwpwhOUt
         60EFWPVCTHcqGPRAmO9Lt3FIr4JQWBM2P3WUqKCiStFeeo5eG4qo85u32vWrfZCyuDfo
         1kZBBKAAeHqNuzbgz315ok+BxLvmzR5EkaV3NI5utmc0YnEHOeQn/ekCSCdppYLFaQmM
         cT71Z7iWYumUhZHqjyO5CA7yEgN3ZypYIPIS7/QJFORT/qkIETdoqdNuDf7jVUeZm2/X
         aYH+hSbAvTvtnDsKU9NWO6dmb8KtQYEwIPUOncOA6WfIkcSHi1opoC6kn0MbNGzJiGEu
         GpdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3ImUz3FU1pgrX6Tj+rrQTGU4cDhJmZLo1aGT7U9bCAG/bYUIri4KpHGC04vglHRSO+7F2wQj5DKZ01g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+PmdY1N2rD4H8h7Ac21q0LDZkozw6K/leRRA3IziCjFkgvc9
	s80+KHa4IrVQU3hqM7t7ErHd30/hpBKnnIALnhQeOK7asNgSr8U9w4PD
X-Gm-Gg: AR+sD13PuoPoI0+lI26xZNUSGDLqCkDSbqYGaJgd1721qlkGT17y7fUShwaTqtbDcLw
	7tiitsLsis0w1Bow+TxFG09C0szNe3+YPH+jFsH1RFDmsMfMt3fsimbvL4SA9s2mZov8ijIgzca
	bWIf1vPdJAi542X0AUB/53sBYR7jEzlC13zlG8whsu1KNeuEJKYDIV6lkyRuzhwVuAocEKkaaLP
	ysGTBBVGULVMhcQ7Ch7kKRWxMd87Map3LZGSCyz1hz19qyEB7xbdLPgrbDWxQ4/ula0l1agoOm+
	u0vFmLojKshOOWfWMhPNcb0QNKji+Wnzf70FXlSo5F+UeJ2dRutohl9Zs/QGfNRImmc2dP1ojnZ
	OVXTEWNqeew5BsIe0c47118VE6bicViIPpRCLFwmPObImkL5P3vhgOVztsFT1paFEXJ6y2DGf4h
	Ox+nUxWxKyyM37nYc7jozzvEatBqfbKzxpX01yxvgJacEiHvBE+YZ65eVh7WDt625la1pUxH4/h
	iaTPEca7crG4pa7J4iC8w==
X-Received: by 2002:a05:6a21:700a:b0:3c3:98d3:c20a with SMTP id adf61e73a8af0-3c67e06200fmr7275734637.47.1785145473520;
        Mon, 27 Jul 2026 02:44:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 19/26] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:39 +0700
Message-ID: <20260727094046.23001-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.

 sound/soc/codecs/wm8731.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ce87280d590d 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -10,6 +10,7 @@
  * Based on wm8753.c by Liam Girdwood
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -110,22 +111,20 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
 		wm8731_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
-	return ret;
+	return 0;
 }
 
 static const DECLARE_TLV_DB_SCALE(in_tlv, -3450, 150, 0);
-- 
2.43.0

