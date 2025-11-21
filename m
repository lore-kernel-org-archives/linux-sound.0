Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AEA342526;
	Fri, 21 Nov 2025 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734360; cv=pass; b=MMJyzux9aXJ5QtlXrDCdTNq/b0Ea5O23v6TL4medAp7mggKZPyWgP0fNeeKzcASVkaC//U4c4j+lIOQiWuQysDZVxG6z936tRIZzFzfhw92CGwfnSnBtCn2fnmhi2GnMIaiaTfBqqnaYO83WENu6mrNc8tIscRz/sPn+IwrnXN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734360; c=relaxed/simple;
	bh=B1Uo4I+QMS2g33FRhhK409zvkqFzSWhgJjuH6mF2MVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7xfyquCL3ogoUJVKeGLjPHSsB+G4/EmGsxNLEVK2ilCB8Jlvp3XdkXmBnuYH+UMZSC+MhtXFbgK1yrlYqNXEMloB8lu/3l3WxOrpsm/7feftn/8+ZyYA53Hwco31RkC0RDTFhPNC8czNakP5j4nReN4oJO9eD85/NFkm0v8+TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=XtVo/4Gy; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="XtVo/4Gy"
ARC-Seal: i=1; a=rsa-sha256; t=1763734349; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WDK3XZ+7/ziK4kMtvqeTrVrjahSrq3KYGiAOuR3kqpLBKZvop2eDrZyiZQ+/d4qLAbeaVd0H28M8GZcLP68Pa3U4tk6uSNXADxJC7696TRiNSniIXsSask7TNKOmYnFb4PsHBAmDmD4SNIyRnzAfn1HT8og7vnsYv55/D05tUlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763734349; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RtX3EPlwaF//L//oMs05r3TbF5sHKvoqV1lkf6z5Rm4=; 
	b=JVSyJNitZhHw46t73xNmzZiVBpqadiIg4s7LKPR7Rxt89KJuMC37NGhSiXeF9nnh0yJoqQw66ZFPXNgClyLIQc5+sFRAImm8gxw6aOKNyj/tk+QHBRzp/lazS1UlxZWeBT77iC8OHWJ3nPmq3od5LnLUBMLHh8cz98oT0WtBT3Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763734349;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RtX3EPlwaF//L//oMs05r3TbF5sHKvoqV1lkf6z5Rm4=;
	b=XtVo/4GyycSEMj2C1UXPdmBMzmV8oAEm3LkBzu+XBUcXN+mZZQ9I0+2LKKNqQKj+
	vJFpclzN3Ym2YSixY7T6FYoth74f92IxdI/7LjMJPwLZQuHtP/leqMrKIGBa2vd9Slm
	Q0tiI6bUxN0YVt+f6I7oNbQOseq3o8qpq/M+zs5zPHElKNLkiqW6Tqr7nHj8aWZ4qlu
	6rGBHb2uziIKGMljQT99QSUaKWVUazxpvVJdGXQRXE7Uhe+FdGy38ZFNCOqKfROncIB
	tfikEQ6iYKuWXDG/VFSNgcPQ7KhkRMUUPizxIbQBzgf0JcrBpVLyUjVmHvGmaS/bzSr
	a0otrcDofg==
Received: by mx.zohomail.com with SMTPS id 176373434771157.06871871712656;
	Fri, 21 Nov 2025 06:12:27 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 4/6] ALSA: ctxfi: Refactor resource alloc for sparse mappings
Date: Fri, 21 Nov 2025 23:11:59 +0900
Message-ID: <20251121141201.850931-5-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121141201.850931-1-me@harin.net>
References: <20251121141201.850931-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Refactor atc_get_resources(), atc_connect_resources(), and
atc_release_resources() to allocate resources based on maximum type
definitions.

This allows specific resources to be conditionally skipped based on
capabilities. This is necessary for hardware variants where resource
allocations do not follow a sequential order.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c | 60 ++++++++++++++++++++++++-----------------
 sound/pci/ctxfi/ctatc.h |  4 ---
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 4719310d0daf..80888fffebd1 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -25,6 +25,9 @@
 #include <sound/control.h>
 #include <sound/asoundef.h>
 
+#define NUM_ATC_SRCS	6
+#define NUM_ATC_PCM		(2 * 4)
+
 #define MONO_SUM_SCALE	0x19a8	/* 2^(-0.5) in 14-bit floating format */
 #define MAX_MULTI_CHN	8
 
@@ -1161,8 +1164,10 @@ static int atc_release_resources(struct ct_atc *atc)
 
 	if (atc->daios) {
 		daio_mgr = (struct daio_mgr *)atc->rsc_mgrs[DAIO];
-		for (i = 0; i < atc->n_daio; i++) {
+		for (i = 0; i < NUM_DAIOTYP; i++) {
 			daio = atc->daios[i];
+			if (!daio)
+				continue;
 			if (daio->output) {
 				dao = container_of(daio, struct dao, daio);
 				dao->ops->clear_left_input(dao);
@@ -1176,8 +1181,9 @@ static int atc_release_resources(struct ct_atc *atc)
 
 	if (atc->pcm) {
 		sum_mgr = atc->rsc_mgrs[SUM];
-		for (i = 0; i < atc->n_pcm; i++)
-			sum_mgr->put_sum(sum_mgr, atc->pcm[i]);
+		for (i = 0; i < NUM_ATC_PCM; i++)
+			if (atc->pcm[i])
+				sum_mgr->put_sum(sum_mgr, atc->pcm[i]);
 
 		kfree(atc->pcm);
 		atc->pcm = NULL;
@@ -1185,8 +1191,9 @@ static int atc_release_resources(struct ct_atc *atc)
 
 	if (atc->srcs) {
 		src_mgr = atc->rsc_mgrs[SRC];
-		for (i = 0; i < atc->n_src; i++)
-			src_mgr->put_src(src_mgr, atc->srcs[i]);
+		for (i = 0; i < NUM_ATC_SRCS; i++)
+			if (atc->srcs[i])
+				src_mgr->put_src(src_mgr, atc->srcs[i]);
 
 		kfree(atc->srcs);
 		atc->srcs = NULL;
@@ -1194,7 +1201,9 @@ static int atc_release_resources(struct ct_atc *atc)
 
 	if (atc->srcimps) {
 		srcimp_mgr = atc->rsc_mgrs[SRCIMP];
-		for (i = 0; i < atc->n_srcimp; i++) {
+		for (i = 0; i < NUM_ATC_SRCS; i++) {
+			if (!atc->srcimps[i])
+				continue;
 			srcimp = atc->srcimps[i];
 			srcimp->ops->unmap(srcimp);
 			srcimp_mgr->put_srcimp(srcimp_mgr, atc->srcimps[i]);
@@ -1367,30 +1376,32 @@ static int atc_get_resources(struct ct_atc *atc)
 	struct srcimp_mgr *srcimp_mgr;
 	struct sum_desc sum_dsc = {0};
 	struct sum_mgr *sum_mgr;
-	int err, i, num_srcs, num_daios;
+	struct capabilities cap;
+	int err, i;
 
-	num_daios = ((atc->model == CTSB1270) ? 8 : 7);
-	num_srcs = ((atc->model == CTSB1270) ? 6 : 4);
+	cap = atc->capabilities(atc);
 
-	atc->daios = kcalloc(num_daios, sizeof(void *), GFP_KERNEL);
+	atc->daios = kcalloc(NUM_DAIOTYP, sizeof(void *), GFP_KERNEL);
 	if (!atc->daios)
 		return -ENOMEM;
 
-	atc->srcs = kcalloc(num_srcs, sizeof(void *), GFP_KERNEL);
+	atc->srcs = kcalloc(NUM_ATC_SRCS, sizeof(void *), GFP_KERNEL);
 	if (!atc->srcs)
 		return -ENOMEM;
 
-	atc->srcimps = kcalloc(num_srcs, sizeof(void *), GFP_KERNEL);
+	atc->srcimps = kcalloc(NUM_ATC_SRCS, sizeof(void *), GFP_KERNEL);
 	if (!atc->srcimps)
 		return -ENOMEM;
 
-	atc->pcm = kcalloc(2 * 4, sizeof(void *), GFP_KERNEL);
+	atc->pcm = kcalloc(NUM_ATC_PCM, sizeof(void *), GFP_KERNEL);
 	if (!atc->pcm)
 		return -ENOMEM;
 
 	daio_mgr = (struct daio_mgr *)atc->rsc_mgrs[DAIO];
 	da_desc.msr = atc->msr;
-	for (i = 0, atc->n_daio = 0; i < num_daios; i++) {
+	for (i = 0; i < NUM_DAIOTYP; i++) {
+		if ((i == MIC) && !cap.dedicated_mic)
+			continue;
 		da_desc.type = (atc->model != CTSB073X) ? i :
 			     ((i == SPDIFIO) ? SPDIFI1 : i);
 		da_desc.output = (i < LINEIM);
@@ -1402,42 +1413,39 @@ static int atc_get_resources(struct ct_atc *atc)
 				i);
 			return err;
 		}
-		atc->n_daio++;
 	}
 
 	src_mgr = atc->rsc_mgrs[SRC];
 	src_dsc.multi = 1;
 	src_dsc.msr = atc->msr;
 	src_dsc.mode = ARCRW;
-	for (i = 0, atc->n_src = 0; i < num_srcs; i++) {
+	for (i = 0; i < NUM_ATC_SRCS; i++) {
+		if (((i > 3) && !cap.dedicated_mic))
+			continue;
 		err = src_mgr->get_src(src_mgr, &src_dsc,
 					(struct src **)&atc->srcs[i]);
 		if (err)
 			return err;
-
-		atc->n_src++;
 	}
 
 	srcimp_mgr = atc->rsc_mgrs[SRCIMP];
 	srcimp_dsc.msr = 8;
-	for (i = 0, atc->n_srcimp = 0; i < num_srcs; i++) {
+	for (i = 0; i < NUM_ATC_SRCS; i++) {
+		if (((i > 3) && !cap.dedicated_mic))
+			continue;
 		err = srcimp_mgr->get_srcimp(srcimp_mgr, &srcimp_dsc,
 					(struct srcimp **)&atc->srcimps[i]);
 		if (err)
 			return err;
-
-		atc->n_srcimp++;
 	}
 
 	sum_mgr = atc->rsc_mgrs[SUM];
 	sum_dsc.msr = atc->msr;
-	for (i = 0, atc->n_pcm = 0; i < (2*4); i++) {
+	for (i = 0; i < NUM_ATC_PCM; i++) {
 		err = sum_mgr->get_sum(sum_mgr, &sum_dsc,
 					(struct sum **)&atc->pcm[i]);
 		if (err)
 			return err;
-
-		atc->n_pcm++;
 	}
 
 	return 0;
@@ -1490,9 +1498,11 @@ static void atc_connect_resources(struct ct_atc *atc)
 	struct sum *sum;
 	struct ct_mixer *mixer;
 	struct rsc *rscs[2] = {NULL};
+	struct capabilities cap;
 	int i, j;
 
 	mixer = atc->mixer;
+	cap = atc->capabilities(atc);
 
 	for (i = MIX_WAVE_FRONT, j = LINEO1; i <= MIX_SPDIF_OUT; i++, j++) {
 		mixer->get_output_ports(mixer, i, &rscs[0], &rscs[1]);
@@ -1510,7 +1520,7 @@ static void atc_connect_resources(struct ct_atc *atc)
 	src = atc->srcs[3];
 	mixer->set_input_right(mixer, MIX_LINE_IN, &src->rsc);
 
-	if (atc->model == CTSB1270) {
+	if (cap.dedicated_mic) {
 		/* Titanium HD has a dedicated ADC for the Mic. */
 		dai = container_of(atc->daios[MIC], struct dai, daio);
 		atc_connect_dai(atc->rsc_mgrs[SRC], dai,
diff --git a/sound/pci/ctxfi/ctatc.h b/sound/pci/ctxfi/ctatc.h
index 0bc7b71d910b..671edc46bd50 100644
--- a/sound/pci/ctxfi/ctatc.h
+++ b/sound/pci/ctxfi/ctatc.h
@@ -132,10 +132,6 @@ struct ct_atc {
 	void **pcm;		/* SUMs for collecting all pcm stream */
 	void **srcs;		/* Sample Rate Converters for input signal */
 	void **srcimps;		/* input mappers for SRCs */
-	unsigned char n_daio;
-	unsigned char n_src;
-	unsigned char n_srcimp;
-	unsigned char n_pcm;
 
 	struct ct_timer *timer;
 
-- 
2.52.0

