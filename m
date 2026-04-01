Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011DF390226;
	Wed,  1 Apr 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034157; cv=pass; b=TvTF1wa4EqEapHTGWeQgpAS4yn9ek2sHiUPQa80dPdE9PIY40AIz3FCUIuXvnplWENIR/+DmPXTUDFfRFtHeNSb00kw6lgbbej6d597okNZDRLJXnMOK3Vv9h/d7QSrvuncHgd+XGN+PLLBwguFnjkALxgPMVKiJHNjxX4xZEko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034157; c=relaxed/simple;
	bh=eV6J9i1zFXJaXndLUjxA7es5DdrhMB8SZoPIPNFCpTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8itoeMLK2gHF+J3yh4xc+/DHff5w875w/isfT3PtS8mSSJ6HIN0QlhQXZv3WS74KkFHXNJkxe5KSHX6J1Ckb26BipLaEL6jeY5nv6LwgLXfPg4pN4sN7AE6JQIFufUx/V99tleW3NdEE3ZZJWklGxTLC+wwiXKaAYzUJM/cE8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=Bmb9QcqV; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="Bmb9QcqV"
ARC-Seal: i=1; a=rsa-sha256; t=1775034145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JxgyPE3ZosEqLdYrJ/61Ip4zrwCjTrT9sR3EdWd0jXzhwwYP5/WxD2hZYw4FrF/OSmcOa3ddicewbPrfQbLELK/uv41GlGwHndltIm/9hwdNFo3zjnpT0nZafu3Pk2XdvjbSw6UNWOMWHkZbsCByxV/9RDnKfGxHiaFoALXucH4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775034145; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=76r6+o5ExReE3EI9O9v1uhT/+oed2hrbjQjU6p2fwqc=; 
	b=O0maQsXZwvMK+pEXgeNBKn7DISt6RkygUG5MhWAhMkCjn0Pzp5OvUqhy3uhYLe+Ylcekq0WYlYAV+yCBlvMjPUIOFae2seaBiaJIW0HnjkHGoFQ/xH3449SwOxFPfPmg+4YqyEwOk2zUfPdMp8kdRE6Y9O/S6riYZOpt3blDmZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775034144;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=76r6+o5ExReE3EI9O9v1uhT/+oed2hrbjQjU6p2fwqc=;
	b=Bmb9QcqVe6GcxQtQEhy0D2O0LtLKZ7qhBkSaHEDbx666jzC78G6G0yWqoT6EdTjv
	zZduCT1Dt1Dw8tTvetV1d5qqZhr9SnDGApRpffl63/75IoYi7xzuPXNzL01RnBTQH+j
	37bcJJaSeTROhwRtZFWJezGIFdjASpp/l0QuWejn95NiI/x+osQIbX8nJV+IUYKJ/24
	gjb4HCiL1dlpIIZX5mIxw/QuJDzJQbKnVim3CGLbYzPS1z6LLqntDcshrOf0M/3GW0z
	pwygl/Xil3pUm6Y7FCY8YEao7Wmnw5qx7MNEdN0nRz+CIwuDjztX52z21BBLz6ntlv4
	R5P42o/7iQ==
Received: by mx.zohomail.com with SMTPS id 177503414395290.22206939588386;
	Wed, 1 Apr 2026 02:02:23 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 2/3] ALSA: ctxfi: Use correct DAIO type for da_desc
Date: Wed,  1 Apr 2026 18:01:58 +0900
Message-ID: <20260401090159.2404387-3-me@harin.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401090159.2404387-1-me@harin.net>
References: <20260401090159.2404387-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Skip the unused DAIO type per model (SPDIFIO on CTSB073X, SPDIFI_BAY
on all others) and use the correct DAIO type directly as da_desc
type. This removes the mismatch and misleading between the actual
DAIO resource and the da_desc type like SPDIFI_BAY (formerly SPDIFI1).
Update related functions accordingly, and drop the unreachable
SPDIFI_BAY case from the hw20k2 daio_device_index().

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c  | 21 ++++++++++++---------
 sound/pci/ctxfi/ctdaio.c |  1 -
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 9e0532fb33ff..7c2f896d531d 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -983,6 +983,11 @@ static int atc_select_mic_in(struct ct_atc *atc)
 	return 0;
 }
 
+static inline enum DAIOTYP atc_spdif_in_type(struct ct_atc *atc)
+{
+	return (atc->model == CTSB073X) ? SPDIFI_BAY : SPDIFIO;
+}
+
 static struct capabilities atc_capabilities(struct ct_atc *atc)
 {
 	struct hw *hw = atc->hw;
@@ -1121,7 +1126,7 @@ static int atc_spdif_out_unmute(struct ct_atc *atc, unsigned char state)
 
 static int atc_spdif_in_unmute(struct ct_atc *atc, unsigned char state)
 {
-	return atc_daio_unmute(atc, state, SPDIFIO);
+	return atc_daio_unmute(atc, state, atc_spdif_in_type(atc));
 }
 
 static int atc_spdif_out_get_status(struct ct_atc *atc, unsigned int *status)
@@ -1427,14 +1432,12 @@ static int atc_get_resources(struct ct_atc *atc)
 	daio_mgr = (struct daio_mgr *)atc->rsc_mgrs[DAIO];
 	da_desc.msr = atc->msr;
 	for (i = 0; i < NUM_DAIOTYP; i++) {
-		if (((i == MIC) && !cap.dedicated_mic) ||
-		    ((i == RCA) && !cap.dedicated_rca) ||
-		    i == SPDIFI_BAY)
+		if (((i == SPDIFIO) && (atc->model == CTSB073X)) ||
+			((i == SPDIFI_BAY) && (atc->model != CTSB073X)) ||
+			((i == MIC) && !cap.dedicated_mic) ||
+			((i == RCA) && !cap.dedicated_rca))
 			continue;
-		if (atc->model == CTSB073X && i == SPDIFIO)
-			da_desc.type = SPDIFI_BAY;
-		else
-			da_desc.type = i;
+		da_desc.type = i;
 		da_desc.output = (i < LINEIM) || (i == RCA);
 		err = daio_mgr->get_daio(daio_mgr, &da_desc,
 					(struct daio **)&atc->daios[i]);
@@ -1569,7 +1572,7 @@ static void atc_connect_resources(struct ct_atc *atc)
 		mixer->set_input_right(mixer, MIX_MIC_IN, &src->rsc);
 	}
 
-	dai = container_of(atc->daios[SPDIFIO], struct dai, daio);
+	dai = container_of(atc->daios[atc_spdif_in_type(atc)], struct dai, daio);
 	atc_connect_dai(atc->rsc_mgrs[SRC], dai,
 			(struct src **)&atc->srcs[0],
 			(struct srcimp **)&atc->srcimps[0]);
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 128cf2f69ac1..69aacd06716c 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -120,7 +120,6 @@ static int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		switch (type) {
 		case SPDIFOO:	return 0;
 		case SPDIFIO:	return 0;
-		case SPDIFI_BAY:	return 1;
 		case LINEO1:	return 4;
 		case LINEO2:	return 7;
 		case LINEO3:	return 5;
-- 
2.53.0

