Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1A1DFFD
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 03:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222169; cv=none; b=ADTd2h0n6g+s44Y/p9b2nSaSkiwENWih1Mw5bPqkDMtyHLTpDqMwnaSTnVarFwcWUM+oWxjOlBJDtCF1bR/LaBjtey7KlowlSlSFaKz0b+DsD6utWjBHBhMJEvGoJmAisLjlLwXToCuohH/AIZSCtqzOuTstPd8bZ39zkOu7/eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222169; c=relaxed/simple;
	bh=oi5HVLOFUi+5T7+n2B55WSFgZ1/NMG+6vjmhTvXqX9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tF9gTIWJamN0rigNc88bblEbGgP/2MgUtEhpv/i+137OwLt4mSTByc+yx4UoQ/vzwYqBGFBWq5aFmBmRxpHBaQcgB9/IoSgUuA2Ei133oviUpKdQDxNKT5GSc1fSBCJvBuvwUafXQZVTeGQPyKZomvK1RfxmHkUTHrV9611JWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WciDBt35; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WciDBt35"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9516a653so31397455ad.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 20:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776222167; x=1776826967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5YdgPKqMHWFilBSm+CVZXL+ET5/4c+Oa35fgJvgT0M=;
        b=WciDBt35QKb5WW3oL9YNz5A8FC80Jyuio9gr0TaUmerqgfFrQ1iAbFOfWJAiV4joM0
         3qZaniIi+PpQYVYnpZ1JL3Eg8wpghj62LwE5fMCKiBoEue2dWXK2KwYP811rJLXG4tc1
         ZCxSG+1c3fX18699h3SoePb3zNusYVtySWbl/ZldJGLbI8jap/P3sGfjqE7UxXSCAs14
         hpU5bF9JdqHtlWXaVdVetLsSDiUYcKu/Nwks7vDJUm23zZ7S+i62a8dTTiMNDObSQ6Nd
         FZHFJ008Qa8++pp3Jmgu27vqwYdck5HJUciuy6ptfV0IrUDxxh0/qtOxd14VPsl/dNrU
         NsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776222167; x=1776826967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H5YdgPKqMHWFilBSm+CVZXL+ET5/4c+Oa35fgJvgT0M=;
        b=ijKf870mYVbw1FlyrtGxrIJzIbLimWYk23ye774I3eTyWysPSqHIy0R5Du5pDHZnkE
         wIlWUeP89MiDJMKH2OR+CGfSxbkPDCFGOoP9c+QbXMxvLyuDxUM/GWmwJMMVIPK074N/
         q9lIPjAYz7Bb1eMJagtYpGWay33SlacnR7Sj3/Hc43NwLq830R4wo3IQ6T2WP3nnxytR
         ucBgez0LMG5auXOiegqmgZrf6BiFIBh58HZagwXR10BxvBmjzKSalnPHN2EiedbQ21A1
         q80oRNSkg7pJhV4wsc0b23jVBK89IT12knO3uT79Ph9RgiYOn4Rh/2L5Z+kdr1Tp5GMv
         vchQ==
X-Gm-Message-State: AOJu0YyaKMhWETr5V0yChdgsPsnzpDz4H2O6dhqeX+VCWPl7LkZuyuel
	7++MUXlyHr7SJmLArwppNeVuylxvyK/3fkZVdKomdpjCq6Vu6JI3kBXJ
X-Gm-Gg: AeBDietb7GOZzmWVzIjNPgPsmuNIlck7yiO89Z5JNd5h3LWd1oUKuAQLloDgdl5drxE
	u19gCY9lzeGwi/Nd1KMtH/0vmpSz5pH+mjPMSoCQqQ5iuzcV+qd5qBjpTPQ193ADDVVUXfq8Ttb
	rg6hVXsiGefzJrr15A4+1f9ePdmKTkzp+bdoq8ipBtR9Z8okVS7XWrjCHup1NqU/kMddoTAhw48
	rAwI8m01LAKWNyuFLqEn+RFtZq0QcZ4SP6Mad/3jv83Hrc5Es0R+pOEHEv6w4BZZ7VLkRnAfZea
	fkrJp+u6syOvdBEsna5owSiiEE+mxGHPk+buM0bQAFS6CGef+310C3G+WhNAYufi18BnhWAKRmS
	94w7A7EadDXod2tyKnLMxdF203dxwK+UsRFud0BzD1i3FjCqiKrJq5i78+CgPrFQ2kurE+W9HtP
	AxR+o9riupZobJPWmDqT9r+sVu9hoekpnW+K6CK60q7Lcl4EJMwCb3fX9ZB81K62L9p/RdJ2BO+
	xQCYOC2QB/5H0I=
X-Received: by 2002:a17:902:bcc2:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b2d591af7emr147905415ad.2.1776222167473;
        Tue, 14 Apr 2026 20:02:47 -0700 (PDT)
Received: from rd-tomhsieh.jhtgroup.com (211-22-143-102.hinet-ip.hinet.net. [211.22.143.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478142565sm3954205ad.37.2026.04.14.20.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 20:02:47 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	matteomartelli3@gmail.com,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v1 2/2] ASoC: es8311: Fix clock leak and check update_bits in set_bias_level()
Date: Wed, 15 Apr 2026 11:02:52 +0800
Message-Id: <20260415030252.5547-3-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415030252.5547-1-hungen3108@gmail.com>
References: <20260415030252.5547-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In es8311_set_bias_level(), the return value of
snd_soc_component_update_bits() was ignored. If this fails, not only
is the VMID selection not applied, but the previously enabled mclk
is left running, leading to an unbalanced clock reference count
(clock leak).

Check the return value and ensure clk_disable_unprepare() is called on
failure to maintain proper resource management.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8311.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index 9e371e2d6eae..564af5c04dbb 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -761,6 +761,7 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 {
 	struct es8311_priv *es8311 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -769,17 +770,21 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
-			int ret = clk_prepare_enable(es8311->mclk);
+			ret = clk_prepare_enable(es8311->mclk);
 			if (ret) {
 				dev_err(component->dev,
 					"unable to prepare mclk\n");
 				return ret;
 			}
 
-			snd_soc_component_update_bits(
-				component, ES8311_SYS3,
-				ES8311_SYS3_PDN_VMIDSEL_MASK,
-				ES8311_SYS3_PDN_VMIDSEL_STARTUP_NORMAL_SPEED);
+			ret = snd_soc_component_update_bits(
+				      component, ES8311_SYS3,
+				      ES8311_SYS3_PDN_VMIDSEL_MASK,
+				      ES8311_SYS3_PDN_VMIDSEL_STARTUP_NORMAL_SPEED);
+			if (ret < 0) {
+				clk_disable_unprepare(es8311->mclk);
+				return ret;
+			}
 		}
 
 		break;
-- 
2.34.1

