Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788731770F;
	Mon, 24 Nov 2025 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007526; cv=pass; b=V6PPIVpxpA+vCiOvaNlYfbqmpDYQkAReGEE/2Mu3Dqo3MPArDZb/yspKuJIkWuSeMtPO1yQEaMLb2TqC/2jtEMJw6ZOt7xSKQPA/D/mJnSm8mqCkLsZxe6IIO/wL304NnUGT/cDFZcovckZ9VjKss0svQp+gQKpRC9Bc1TqXAGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007526; c=relaxed/simple;
	bh=j58FQUTXArwPNUYV7va7z785ptJUw8Z/oYJHVe0xVIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4BWcd0dFWTmNOiWNpuGVhhmNZNtyN1Nyq69OM8VnF9wAfPXFEMmvvoXeIcHXV3YQPiwTuNmrB+jaFbM39bjxV4z2FT95BFU/37/YEsrH4SsIzUX8ORdGMba1+PzZfFAyENQx5C5siAarIRrqio0zH1QKof/HV/wfSsvYT50DUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=eku12sk2; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="eku12sk2"
ARC-Seal: i=1; a=rsa-sha256; t=1764007518; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eYHZM0SEVQeytrYePyk1lzSo+i6J0D0D01qH/7Iw9n7w1wXlPq7kSzAgzpdzFat4DSaTvHdwdujTVibyEgXFOuFOuqQn1K+dTNz2viTpPN+tU4UlI08hqEAKIU8Xu3zqEReNNrGdUYu5CL7k7o67UaeVaIJRP6fRxf4F46fNfRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764007518; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=neqcLqAo9F3udVjLYJqUnPOjvKlxbs5oBM9j7O9MT90=; 
	b=Uzb3zAk6U7fpZACkXiTWDl8QJPyCtDnSGXSgW1DeWgI7655pqlf9Y3uRCRUDpl/yudf3LzzSEXuK11EJLaFzpfiDCH1FPNUhBqOP/kPrlJJmon2OwiSGhBQjptM1GUdKMq9xGll5Kyj1RMGH38ys3fOAsGMFFbKJRsL5R6XW0ZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764007518;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=neqcLqAo9F3udVjLYJqUnPOjvKlxbs5oBM9j7O9MT90=;
	b=eku12sk2bYu1PO0ZbBEeUa6X4WecJ8BHJtCS/g61d2L8y8Ectpxn1Ndg3z8ogmjb
	bGH4lpdVshpqDzPhCK+W/EDY/3ldWFUtp1FFSPcdIYom6Na21b4BRIQDGC0WZJTX5eT
	6Wc3GH10Asx6h5DkhqDeTizCsLjRIoAq06QkuhO0rydyD1x/lTQWwQAw+P7iobWT+ev
	G1fCIfIY6/foQM8dyh+Ss2EK8zMaQg9vzFDDS9YPkmK5/lRyhRlQSV9vI5VD0sMVIUX
	buuErN8yGJQbzE0tegf5MjEfITXFl0DKsP50Jrm+3wqgolVsEKqj7Vz1YzLjlMomEYN
	dWU8jAzK+A==
Received: by mx.zohomail.com with SMTPS id 1764007515868488.3052882402628;
	Mon, 24 Nov 2025 10:05:15 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v3 4/6] ALSA: ctxfi: Refactor resource alloc for sparse mappings
Date: Tue, 25 Nov 2025 03:04:59 +0900
Message-ID: <20251124180501.2760421-5-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124180501.2760421-1-me@harin.net>
References: <20251124180501.2760421-1-me@harin.net>
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
index 55bbeb891afc..ce2b16722118 100644
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
 		da_desc.output = i < LINEIM;
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

