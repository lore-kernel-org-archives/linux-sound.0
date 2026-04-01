Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB835AC27;
	Wed,  1 Apr 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034158; cv=pass; b=tUmQY2caClWrB7PBiaVFVcjp4HQHrN/zz3jn3k5uNKOknAgK6KDr6jhrGxU5fHhJm+x5uO+XMQ+zzKoIilzD18PsZeyVOasenzHbT4/o61M8/gWXWFOrSuD1C+bIT2YAMOOHakubfxcbJcE2uRhmSObVhhpOAWR/AChICSoVZ1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034158; c=relaxed/simple;
	bh=AtkfY7JyaUXIOn+BKXEgMb9eIU4AZ90BPccaSNHJvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V10Xg+7rzu7Z7S4b5ocLZvaEmg82Ce9ZXQPEKHdFhaveH+1qLLnSHSWsOBpMzSgJoDps3qxUfYFbD1EuF95TJYvTBWWEj3xDcg7qzASGkVG4cmW6d3xYwdNO3NvewUztoqZ/Xq38y4JwD5wT6U0Q7RZKLyIIlqYD9aH/jqda3xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=c1xC+ieU; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="c1xC+ieU"
ARC-Seal: i=1; a=rsa-sha256; t=1775034148; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=als3VuB8DitBB1KB50CRnI8/BEJF/djer2N6MXCvxQwj1Sifb0DxRIpdRJCvuXbwR8Dy+s2WYOd2i8h9SD6vw6yfKWqiiHorvaRMHQB224oFQ+S8l23f293C8xSfcGLtJ4WiFui/yfVdfsnFx9Na4CN5I4aVe350SCwMLloPNDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775034148; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/E1Gu24wcnQwed78ETx1R75P6zZrVVh+YgqY4pQOVQU=; 
	b=Xdo3TWCEtYscGTe7OAenizQBdWT6r/CJ16Uw0WL/C9YrMEmxEo/JSZ9qFTTzJKCjzZYLtIwHgHl/XRlfh+3e4erA/J+ZnIHOV/e4s5Ula8rTJAuT0AsAEyfcwU9PgZp8zwpVlsw6iPFun97/xlNE3m87UYbGnYO99DTWPZW52NY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775034148;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/E1Gu24wcnQwed78ETx1R75P6zZrVVh+YgqY4pQOVQU=;
	b=c1xC+ieUx5/5L/jOaKGiuJPfhYcvtE3LrJbHK9Am5Nx7fULM7AvJ3oiGpD7VisH5
	7G5o0pEKQE+eW0iWfM1DMUWow5PWf+v7N2fWfKdCG1aUXAMYKpEa0ZswIlDf6z/bSeA
	PCAJlNJ6IZECqugsGl5+ctUVt+xn9t5KwyGh6cYcXTJNHod0zkC2LcbryIPV/GIoMe2
	b0Q271M6sbDcbvJhHz8iLw8vAP3oKsOcjmiM/cHTLlg5APhV1cslQM8iE9jOm2U9+On
	ox2SN8Z0M+Ci5OZOdjud3ib/1YfiOuPGTfNpMtaRcNHN4vDGIVY6epm2ZqZ3J0Jm3D0
	ljw+V4F4ZA==
Received: by mx.zohomail.com with SMTPS id 1775034146298161.9473388494282;
	Wed, 1 Apr 2026 02:02:26 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 3/3] ALSA: ctxfi: Precompute SRC allocation loop bound
Date: Wed,  1 Apr 2026 18:01:59 +0900
Message-ID: <20260401090159.2404387-4-me@harin.net>
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

Replace the capability checks in the SRC and SRCIMP allocation loops
with a precomputed loop bound. Cards with a dedicated mic input
(SB1270, OK0010) allocate all NUM_ATC_SRCS entries, otherwise stop
at 4.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 7c2f896d531d..516c0a12ed9f 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1409,9 +1409,11 @@ static int atc_get_resources(struct ct_atc *atc)
 	struct sum_desc sum_dsc = {0};
 	struct sum_mgr *sum_mgr;
 	struct capabilities cap;
+	int atc_srcs_limit;
 	int err, i;
 
 	cap = atc->capabilities(atc);
+	atc_srcs_limit = cap.dedicated_mic ? NUM_ATC_SRCS : 4;
 
 	atc->daios = kcalloc(NUM_DAIOTYP, sizeof(void *), GFP_KERNEL);
 	if (!atc->daios)
@@ -1453,9 +1455,7 @@ static int atc_get_resources(struct ct_atc *atc)
 	src_dsc.multi = 1;
 	src_dsc.msr = atc->msr;
 	src_dsc.mode = ARCRW;
-	for (i = 0; i < NUM_ATC_SRCS; i++) {
-		if (((i > 3) && !cap.dedicated_mic))
-			continue;
+	for (i = 0; i < atc_srcs_limit; i++) {
 		err = src_mgr->get_src(src_mgr, &src_dsc,
 					(struct src **)&atc->srcs[i]);
 		if (err)
@@ -1464,9 +1464,7 @@ static int atc_get_resources(struct ct_atc *atc)
 
 	srcimp_mgr = atc->rsc_mgrs[SRCIMP];
 	srcimp_dsc.msr = 8;
-	for (i = 0; i < NUM_ATC_SRCS; i++) {
-		if (((i > 3) && !cap.dedicated_mic))
-			continue;
+	for (i = 0; i < atc_srcs_limit; i++) {
 		err = srcimp_mgr->get_srcimp(srcimp_mgr, &srcimp_dsc,
 					(struct srcimp **)&atc->srcimps[i]);
 		if (err)
-- 
2.53.0

