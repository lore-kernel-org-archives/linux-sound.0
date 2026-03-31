Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805641B372;
	Tue, 31 Mar 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971329; cv=pass; b=uQCyhKF8nYseLmWSty/NYBdsToa4+MyaWu0lfAekH+uf3uUzfXpjE2F2EOvV7mU6PP3+A2ALq//Xv/DkcchqGOU29M4t4E0Y5W6sJBABcE4rbcYpYyhGU7aR31g/3ea2U+nGCZ3Mp0wc0k5Q6JeIkoYmo88G4uZ6xONxXbVgISw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971329; c=relaxed/simple;
	bh=H/tzLyCGZvJNjDWK/WsEO+l1aslwvu7+ObxIW6jdTZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqoAs1WqJVRtQfslrlpSD65oswDwx7z1W401aS9FZwy00T3F6og1LvptmVBsL2eZdHE5jnu76rfEBmePjdC1DYYsD367M4K7KPELyITVi6AI1IQe7Nva/D2LtyVbjsV2TVf9bo5Qep1Koa60DU56QjkUugHoAGqhmVLbFg+1iz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=CgueK7dC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="CgueK7dC"
ARC-Seal: i=1; a=rsa-sha256; t=1774971321; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qs/SlOTiN8IGMsJs7z1SoGXpIarnKvjvF5dnTLFwQPUTGMXA4zbyAB75J4ZtGohTBwzMwoVkPf2FqKxEAOKUWAozq3symoULq2RKScUFCI/J7J/RSFqzm/Z3DinfNl9D1G4DLbBksTQVFbHWENZmWMfIEk4ytLI1k0eR7zCC+OU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774971321; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=W0dNABflnvy0nZZkH34907CQ+8F4GTV2BYhFEOA3oOQ=; 
	b=ODthPPLjlSu6w03Smzt/ROKgcwIQ2s5uN6kPSiwnuuzg4upbUq3Li8DWj/Apr6d4pIv+q6vjPFX2tUqqGqGhsUAhB0bXDa/iIFhF5xzeUcYZhtioHqQcNYbROpoRWalPpR2OKqWioCjURKkWmxg4x0TYIRLVInMeCw12q4X9AiQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774971321;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=W0dNABflnvy0nZZkH34907CQ+8F4GTV2BYhFEOA3oOQ=;
	b=CgueK7dCM8JzJXyfdooHa9CSebFkfeYgDTEUbp6caGXFYclXfV4VZgS9FY/uhOSA
	Efl8TLKCdza87+JieAbcP9jutCzw/gcEYLjFLd/YA7ivhUC97MxxRtLWjyyT8Nzm/9F
	2k8vdsBx0gA//ORUj1hG2eTUUL2ifeuNgcq1xzbe2krFIwlWJfzuNjisAvSW3PmEwIC
	dWYHTb1FQpxaFb7fiR/UoTXDnmJceI1hnD8OPS7jztUCFbc9AQSTu8+aquaJ2VamAhd
	DrXsj7eyIoJHspjb+dZXz1a7uw1364L1z6HsInn3id/5fhWKn70NQgUzRGaTSCbJu1S
	NY+0ddmLvA==
Received: by mx.zohomail.com with SMTPS id 1774971319393580.4959151433793;
	Tue, 31 Mar 2026 08:35:19 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 3/3] ALSA: ctxfi: Precompute SRC allocation loop bound
Date: Wed,  1 Apr 2026 00:35:07 +0900
Message-ID: <20260331153507.2934795-4-me@harin.net>
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

Replace the capability checks in the SRC and SRCIMP allocation loops
with a precomputed loop bound. Cards with a dedicated mic input
(SB1270, OK0010) allocate all NUM_ATC_SRCS entries, otherwise stop
at 4.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 9a1f6cebaa32..d969b70431c9 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1405,9 +1405,11 @@ static int atc_get_resources(struct ct_atc *atc)
 	struct sum_desc sum_dsc = {0};
 	struct sum_mgr *sum_mgr;
 	struct capabilities cap;
+	int atc_srcs_limit;
 	int err, i;
 
 	cap = atc->capabilities(atc);
+	atc_srcs_limit = cap.dedicated_mic ? NUM_ATC_SRCS : 4;
 
 	atc->daios = kcalloc(NUM_DAIOTYP, sizeof(void *), GFP_KERNEL);
 	if (!atc->daios)
@@ -1448,9 +1450,7 @@ static int atc_get_resources(struct ct_atc *atc)
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
@@ -1459,9 +1459,7 @@ static int atc_get_resources(struct ct_atc *atc)
 
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

