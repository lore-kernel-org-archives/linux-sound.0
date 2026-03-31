Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F4D41B363;
	Tue, 31 Mar 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971329; cv=pass; b=iWePCs6ZzyrddAqi5CPSW3vwXFXUoEz3LO3Ip5r3ZGI/fMEoYwl9f6kBGyLPncr1QR/GdXC402UWFZzz9d9rd1RlVklaQ8MT9cTXTqgVnf33LY6VB85xELuZcoZblbmChkY2C+7xk9yKI9HDa50cFG/uKIGepX+dQiYfA8kx/Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971329; c=relaxed/simple;
	bh=blYfoQdxlUno/QbkNsoSm2QGfoCKCdN7A66a23gd+Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGMl5RD9j1BVTHaJjQbpHJi1PgYsfnBy2FAgTOpfvbVco5mcMydtFGxq5fnfFSsOxLzLArHyYL2V2/H4U2OdYEDs+V+QI58oJKPUnKVEvX1U445j2eXdz22KKGCwNUl+hN2HW/2uPbzUDQ5Qvc2YpD+A/LNcy8uiFI8oKsxJZh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=IyJXXTMU; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="IyJXXTMU"
ARC-Seal: i=1; a=rsa-sha256; t=1774971319; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l6ScYLfNzcpMfCt4wcCtRiQvLedHQfWvd6yNGFRLnpuV8NvDAqV0qTMa3ZObIUr599bvAJIlbAVzA5P80VNiDpWtyt4Awa8ef2tcfm1JKgzvGExM1hwciF0cgRqQbm3atWi40Go0O+2tcJnzIH6z3MBUxNWp5JsHgXQQos8TmlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774971319; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6b88KTEvG3ODJv5UyR27GmEymxtjMI+nHspKrUwgo7s=; 
	b=STk2rLZWksuOBt3ynU4rTy1S7VLlBZWcc64/zMIMwtLb+4zqSdALZnYpDnBTZBNa9XrDPRASd6DMMX/nWoexMwBiGWzSaUWodtF/zyWq0zqPkZhmzVV5cE1T4KTNG0rNiK8dnoR/88ZN0qm3khTcqKMrp9baqVOZxUOgq/L7o5Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774971319;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6b88KTEvG3ODJv5UyR27GmEymxtjMI+nHspKrUwgo7s=;
	b=IyJXXTMUrvIHlabdTTx7MOb01WHkmuR4YnqXleadnzvSeQu0y5dMN5NDlBiAT2s/
	qjSK8j+eU2jjEqiqk6TJ01zMiG2ThOPBzyLulUGyMkh8c/+zaqlfTbkZYvfGZX9kSxi
	AkYKrA57Jc0Yar9Jq4gYsZHJhlV2THriOEHiils94AttSUhOjeMNJU+dkrjXL8ViTXb
	sJoBeXwM0TXC7ofdf2YNYupgDXZMuUYxgqUbKwgGzPINkcnQ7Gm6aq5jMSCcN55c0S+
	penkRJcre/y5iU1YK8eMR9ecETmE5vIQCVnuU5y0Dl4gUCH5MlbVooLyUdlf2rZ856o
	2DljNYIrlw==
Received: by mx.zohomail.com with SMTPS id 1774971317223901.5307172316649;
	Tue, 31 Mar 2026 08:35:17 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 2/3] ALSA: ctxfi: Use matching DAIO type for da_desc
Date: Wed,  1 Apr 2026 00:35:06 +0900
Message-ID: <20260331153507.2934795-3-me@harin.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331153507.2934795-1-me@harin.net>
References: <20260331153507.2934795-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Skip the unused DAIO type per model (SPDIFIO on CTSB073X, SPDIFI_BAY
on all others) and use the matching DAIO type directly as da_desc
type. This removes the mismatch between the actual DAIO resource and
the da_desc type like SPDIFI_BAY (formerly SPDIFI1). Update related
functions accordingly, and drop the unreachable SPDIFI_BAY case from
the hw20k2 daio_device_index().

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c  | 17 ++++++++---------
 sound/pci/ctxfi/ctdaio.c |  1 -
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 9e0532fb33ff..9a1f6cebaa32 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1121,7 +1121,8 @@ static int atc_spdif_out_unmute(struct ct_atc *atc, unsigned char state)
 
 static int atc_spdif_in_unmute(struct ct_atc *atc, unsigned char state)
 {
-	return atc_daio_unmute(atc, state, SPDIFIO);
+	return atc_daio_unmute(atc, state, (atc->model == CTSB073X) ?
+		SPDIFI_BAY : SPDIFIO);
 }
 
 static int atc_spdif_out_get_status(struct ct_atc *atc, unsigned int *status)
@@ -1429,12 +1430,9 @@ static int atc_get_resources(struct ct_atc *atc)
 	for (i = 0; i < NUM_DAIOTYP; i++) {
 		if (((i == MIC) && !cap.dedicated_mic) ||
 		    ((i == RCA) && !cap.dedicated_rca) ||
-		    i == SPDIFI_BAY)
+		    (i == ((atc->model == CTSB073X) ? SPDIFIO : SPDIFI_BAY)))
 			continue;
-		if (atc->model == CTSB073X && i == SPDIFIO)
-			da_desc.type = SPDIFI_BAY;
-		else
-			da_desc.type = i;
+		da_desc.type = i;
 		da_desc.output = (i < LINEIM) || (i == RCA);
 		err = daio_mgr->get_daio(daio_mgr, &da_desc,
 					(struct daio **)&atc->daios[i]);
@@ -1569,10 +1567,11 @@ static void atc_connect_resources(struct ct_atc *atc)
 		mixer->set_input_right(mixer, MIX_MIC_IN, &src->rsc);
 	}
 
-	dai = container_of(atc->daios[SPDIFIO], struct dai, daio);
+	dai = container_of(atc->daios[(atc->model == CTSB073X) ?
+		SPDIFI_BAY : SPDIFIO], struct dai, daio);
 	atc_connect_dai(atc->rsc_mgrs[SRC], dai,
-			(struct src **)&atc->srcs[0],
-			(struct srcimp **)&atc->srcimps[0]);
+		(struct src **)&atc->srcs[0],
+		(struct srcimp **)&atc->srcimps[0]);
 
 	src = atc->srcs[0];
 	mixer->set_input_left(mixer, MIX_SPDIF_IN, &src->rsc);
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

