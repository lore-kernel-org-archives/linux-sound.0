Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA91433D6CD;
	Fri, 21 Nov 2025 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734359; cv=pass; b=JuTmMvOL3qP8du3MfT8+u8anczEPpiVDB5RvSmPnjXwbFi8xoSbk4ULxXf9np8jaWNo547Ak9s7YikN9/HJ1DazJg+IG4myby7c28ZC/V3PNfgAeoelud03SW/PWranlEmiBXrgSlMhDZfcvoJDSbViYW88AX10QeUoFdaC2vng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734359; c=relaxed/simple;
	bh=cvE0gK8GFyqHqeLS9tlgg3O+qTSh0GGhikJbWq2UmsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By8pmjWDGqux8SpS+vGoadZrDm4augLPIHmKFRouRQ3JfuT1stOkkrrzDdOm/bJClPRw6wpVLT1dviMk6v1IblQ7bgHLOUKWWBY1jNz5XaFex52LsXqQY6oqlMak/VP5LVShJWLU5M67hJlCR4YMkqtQTRuduK5jYRm+kU8X6XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=J1/pwhZd; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="J1/pwhZd"
ARC-Seal: i=1; a=rsa-sha256; t=1763734347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=INBzithBwng6LePkh9tpBjix69x9kmTCko1wUxUP3/FhoR04glwC/Ixb2CN+iRsxd+l6GEgmpl977O+mE3yyPUbdpYL8H210xeAY2BmrmZ3mGSfcePIjteokbhD41mAhSXMEmQmt62nZCzuCrwR29KkJvUTvC9+bOr2EjKnG3fM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763734347; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R2sMbLrTwMVsiTBJtqP3HgefDwrj/DVNSppBJ+oYTjA=; 
	b=IBVnRLNsVl9f+6KMrjL4N0MRxYSaXkcGLMFRBCiwETTxeqSLM94Tl+G20BBzHUP81ml2ov5W/jrxFQA/oVyPj/CRj/aDFRKr1wDCXYGbMHHXcFIIMgIUHNgKwwFGqivBKiCUxF2Q8BDhAwImA69GKZz6OE6iEh+u0dPRUirACfI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763734347;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R2sMbLrTwMVsiTBJtqP3HgefDwrj/DVNSppBJ+oYTjA=;
	b=J1/pwhZdEk/jYMdXpo21xh6eut7FX6ng3LevnjptYQrCF2bQlrCb+zUlWPt3Chf7
	Jir5Ugzo/X4Gjp9/2ksmcMjfUWxpUZhHkoj2zu//PP5mPGQ6lKR+0zrFn5ICQwjSjrw
	c3gNwwAnXZ7Jeu2dCOHm08+Wr0kQU9J4Mg2a36Yj4SMgA/waeQFdRduWH4dD998QKsT
	FJcO5mClmz2ldUnjfRYP2aQbg8cwePNISbk7yD218VSACGzwINSASmsnK5wVH+Ebtvo
	nz6hgYz4gcKhigpRu2JNqHEwVwV2h8Vo6k5OT0cDpVeOL9E8TfRmQjOQVtYIJCpZSGY
	iwUI7y2jsw==
Received: by mx.zohomail.com with SMTPS id 1763734345946377.66031601063594;
	Fri, 21 Nov 2025 06:12:25 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 3/6] ALSA: ctxfi: Use explicit output flag for DAIO resources
Date: Fri, 21 Nov 2025 23:11:58 +0900
Message-ID: <20251121141201.850931-4-me@harin.net>
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

Replace the index-based type check with an explicit output flag in
struct daio and struct daio_desc.

This allows handling DAIO resource types correctly regardless of their
index. This is necessary for hardware variants where resource types do
not follow a sequential order.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c  |  3 ++-
 sound/pci/ctxfi/ctdaio.c | 14 +++++++-------
 sound/pci/ctxfi/ctdaio.h |  2 ++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 14779b383d9e..4719310d0daf 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1163,7 +1163,7 @@ static int atc_release_resources(struct ct_atc *atc)
 		daio_mgr = (struct daio_mgr *)atc->rsc_mgrs[DAIO];
 		for (i = 0; i < atc->n_daio; i++) {
 			daio = atc->daios[i];
-			if (daio->type < LINEIM) {
+			if (daio->output) {
 				dao = container_of(daio, struct dao, daio);
 				dao->ops->clear_left_input(dao);
 				dao->ops->clear_right_input(dao);
@@ -1393,6 +1393,7 @@ static int atc_get_resources(struct ct_atc *atc)
 	for (i = 0, atc->n_daio = 0; i < num_daios; i++) {
 		da_desc.type = (atc->model != CTSB073X) ? i :
 			     ((i == SPDIFIO) ? SPDIFI1 : i);
+		da_desc.output = (i < LINEIM);
 		err = daio_mgr->get_daio(daio_mgr, &da_desc,
 					(struct daio **)&atc->daios[i]);
 		if (err) {
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 10d0a7088718..f012d47689d1 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -18,8 +18,6 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 
-#define DAIO_OUT_MAX		SPDIFOO
-
 struct daio_usage {
 	unsigned short data;
 };
@@ -329,7 +327,7 @@ static int daio_rsc_init(struct daio *daio,
 		goto error1;
 
 	/* Set daio->rscl/r->ops to daio specific ones */
-	if (desc->type <= DAIO_OUT_MAX) {
+	if (desc->output) {
 		daio->rscl.ops = daio->rscr.ops = &daio_out_rsc_ops;
 	} else {
 		switch (hw->chip_type) {
@@ -344,6 +342,7 @@ static int daio_rsc_init(struct daio *daio,
 		}
 	}
 	daio->type = desc->type;
+	daio->output = desc->output;
 
 	return 0;
 
@@ -433,6 +432,7 @@ static int dao_rsc_reinit(struct dao *dao, const struct dao_desc *desc)
 	dsc.type = dao->daio.type;
 	dsc.msr = desc->msr;
 	dsc.passthru = desc->passthru;
+	dsc.output = dao->daio.output;
 	dao_rsc_uninit(dao);
 	return dao_rsc_init(dao, &dsc, mgr);
 }
@@ -518,7 +518,7 @@ static int get_daio_rsc(struct daio_mgr *mgr,
 
 	err = -ENOMEM;
 	/* Allocate mem for daio resource */
-	if (desc->type <= DAIO_OUT_MAX) {
+	if (desc->output) {
 		struct dao *dao = kzalloc(sizeof(*dao), GFP_KERNEL);
 		if (!dao)
 			goto error;
@@ -565,7 +565,7 @@ static int put_daio_rsc(struct daio_mgr *mgr, struct daio *daio)
 		daio_mgr_put_rsc(&mgr->mgr, daio->type);
 	}
 
-	if (daio->type <= DAIO_OUT_MAX) {
+	if (daio->output) {
 		dao_rsc_uninit(container_of(daio, struct dao, daio));
 		kfree(container_of(daio, struct dao, daio));
 	} else {
@@ -580,7 +580,7 @@ static int daio_mgr_enb_daio(struct daio_mgr *mgr, struct daio *daio)
 {
 	struct hw *hw = mgr->mgr.hw;
 
-	if (DAIO_OUT_MAX >= daio->type) {
+	if (daio->output) {
 		hw->daio_mgr_enb_dao(mgr->mgr.ctrl_blk,
 				daio_device_index(daio->type, hw));
 	} else {
@@ -594,7 +594,7 @@ static int daio_mgr_dsb_daio(struct daio_mgr *mgr, struct daio *daio)
 {
 	struct hw *hw = mgr->mgr.hw;
 
-	if (DAIO_OUT_MAX >= daio->type) {
+	if (daio->output) {
 		hw->daio_mgr_dsb_dao(mgr->mgr.ctrl_blk,
 				daio_device_index(daio->type, hw));
 	} else {
diff --git a/sound/pci/ctxfi/ctdaio.h b/sound/pci/ctxfi/ctdaio.h
index 15147fe5f74a..b337da2de8b5 100644
--- a/sound/pci/ctxfi/ctdaio.h
+++ b/sound/pci/ctxfi/ctdaio.h
@@ -43,6 +43,7 @@ struct daio {
 	struct rsc rscl;	/* Basic resource info for left TX/RX */
 	struct rsc rscr;	/* Basic resource info for right TX/RX */
 	enum DAIOTYP type;
+	unsigned char output;
 };
 
 struct dao {
@@ -91,6 +92,7 @@ struct daio_desc {
 	unsigned int type:4;
 	unsigned int msr:4;
 	unsigned int passthru:1;
+	unsigned int output:1;
 };
 
 struct daio_mgr {
-- 
2.52.0

