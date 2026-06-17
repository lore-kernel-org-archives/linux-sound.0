Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3331E823
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781720517; cv=none; b=cBL+6+4tQC18t4stGYSPsOGyo4pmREvzyWJKZ3YLsIXAh2zt7Zzl/mEsB9DN4DiWxYB7Sn17Q8so0qRWuDv2I8dFN9L6Iqh0e92dq/U2svZmb5H3ZFaY0ulNGUi9J15+cH2MJ2h7XbNPr4+eK9uijoXPm9SnyfMSrNudT/cNIWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781720517; c=relaxed/simple;
	bh=YH8ddk1uOZv5MsVhQHXZldbqbgDr8aDpn69KDbJKBXo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tRE9IGUpYss2ddp9kNvPMIdZnrD38V87ZSOg0dMm8FmRZW2PyrIcZVAhX8XSazu1Gh5ATIiHwslR/QtEfTiAh1yhNIuW1bJlSq2ayzNOI4JAsCegWwcPdeHkzEOPY3a4siPM/gQLSjOvesF4jWcSbWP3845aRar+lxK9AkySO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOSta2CX; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOSta2CX"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13988680a69so269016c88.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 11:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781720516; x=1782325316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0iYXs1cU5u1YpR2ayFZC3+vq4V6UqvGux+DRBVroafs=;
        b=TOSta2CXuLwsYmh6xziVhj38C1zG1onTFN6LbYI3UifLpOO1UxdssTRCfIrMFal4dG
         BDBx8SNGVw1ZiE90pGVE+Vva9w0uqr4ErWqjhwZq0gDMwKDekbM8xIuTwF3bLAOGxLMa
         R18RRZpyF308Bz/NmRWoZ6OJ22caKrZFSTi2r3b70fAaFY92T6C6Awk8pJl+yZ9SS9T/
         hW2ZKvDBPDzfoW0JppzADBKFXE831RtS6j2FoV8L6OXxe4vXK2AdBJVxQfoQKj3E9JAz
         UQkPSTKibANZCsXksswylynXTpVkmxlSsFjiAYUq9TswofOLM0XVe+zA9rLpS2ZHLf7Z
         LmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781720516; x=1782325316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iYXs1cU5u1YpR2ayFZC3+vq4V6UqvGux+DRBVroafs=;
        b=W43BsUc+2IXIFgVzSfXAcXTPRJ+SWXDqoREUn0uPtfyfcwFCR7laGo3ezjx1JrFd7i
         J+uzBp6n0ugHkTC7Z2igKz+Vr4n/l1w/0lYdp6PbV28NIhXuo4nV0ryujBt96K4fvlTA
         Q6WtgvlIrvubYdvzpBrPtklAq7ia+ysVxv8gUUCHlyrTE1cJZbyUjHsjOQPR57OrX74n
         zashR4IXG/bgtIaJykm7ISJhOa4xxVBb1Ux95EidUa8/iIIM+fwmgBNe3JBfW3JSPZP+
         kJuDFCCy9N3M9VbFoIuO97T7xAbCzByBg/gcaWHKDkUzkzuSGZSb2CyVXDb7zRHrGEy1
         FYbA==
X-Forwarded-Encrypted: i=1; AFNElJ9imh51foAWcWdjJkTXxAfuZjRyhDBq9ilqKEMgiQ3Q3pOdzBUr85S1OXA30Q9c/z9ahguBybWJbb4SKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXOBUy24hFcDG840mOfPbkYsvZMee16GnlGZ7lZ7D5zUAxFbMm
	YzeEp9KidhkEudpJYfAkcoMUc3s7Ku0jaoDTijIBJzPQ6tp2B1sD/vxz
X-Gm-Gg: AfdE7ckZx67tEX53Vkc7KEZ88ESrsYcigpqz5HZ4dOOEQx0B6yyuXiO5WK3cKfX3e+F
	sf0I4VqDnapZ2m/daVprf7NbH4d0S2+9YkrKMprBWdN9G0Ogao/DpOXPjTGm9OftBnVz9DfQnBs
	svD6vh3k05seJjUzMaKdjzUZJo6yfqP1KQCa8/KYIjJt+83NFsNyEHXoQNJMW9SzdOuKIHOy8kb
	Ch66ypGOQI0s0bC/ywamnt6x61d8kU0i0T8RC7hsgRt22p1ID0mZb7aJJQlaLepVafTp1DI2PmV
	UA1bKmgWxkmBIYbprhFx4MA7jSeoWqaCr2wyvYP+E+m/zorQw1sCPHeHlRl4mmAnRrZenvorQJQ
	SsT/6EyiS8PPoeEncw4UbQC/qhNNLsyN/EAihB4+MHDOHzHZvut3fpXUio6a0l3pa9rYnuEh63I
	6Wh34V/1GXF61FL5wqnpiX7sO1oODwn0lb
X-Received: by 2002:a05:7300:6cab:b0:30b:e3c7:27f0 with SMTP id 5a478bee46e88-30bf078f484mr61879eec.13.1781720515950;
        Wed, 17 Jun 2026 11:21:55 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm23479792eec.30.2026.06.17.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:21:55 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm: initialize graph refcount before publishing
Date: Thu, 18 Jun 2026 02:21:50 +0800
Message-ID: <20260617182150.959983-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

q6apm_get_audioreach_graph() inserts a newly allocated graph into
graph_idr before initializing its refcount. Another caller looking up the
same graph id can find the graph and call kref_get() before kref_init().
Initialize the refcount before publishing the graph in the IDR.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2e5b25b8d00fd..1953e8ca8777b 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -65,6 +65,7 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 	graph->apm = apm;
 	graph->info = info;
 	graph->id = graph_id;
+	kref_init(&graph->refcount);
 
 	graph->graph = audioreach_alloc_graph_pkt(apm, info);
 	if (IS_ERR(graph->graph)) {
@@ -85,8 +86,6 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 	}
 	mutex_unlock(&apm->lock);
 
-	kref_init(&graph->refcount);
-
 	q6apm_send_cmd_sync(apm, graph->graph, 0);
 
 	return graph;
-- 
2.51.0

