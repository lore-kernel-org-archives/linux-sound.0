Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A28E25A65B;
	Fri, 17 Jan 2025 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737078247; cv=none; b=dmK2/UPl8LE5gpfDuQ1YpBpt7Mbz9CMfa/HAOPZojkvcI531ioQ366eQJP/E42JqERJX26+q36NDhUiUBCIMN6J1nyZ1ryC7PSvhroDeZNJJtQESTKyeTb4c57rmlHTik/jMol2BKwis6dB8NcsysydmaLNXyccAgUdjsiPOspo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737078247; c=relaxed/simple;
	bh=KyHgCa9a76UUo0DmPRjWB8YyoC0LkzmhmwFusLuTfXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0tsXhk3/ZNmG8Dx1bdHAugcqZf8j855Xi4CxHFEzPL1PMNzBy+SgcCmcRUF18eW1NUTvvLtor8fyziE0F9QxqnMY7qb2vCRXc8ImyzWlt+FEJZtWu9l2DlpA2gIxdWdARCcX/QTHtZx15vsdrvztvdpgBVEQs8Z/0bgwNKiaXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 83e6db70d47411efa216b1d71e6e1362-20250117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:88e6b737-063f-4ceb-b9ac-f5fd5a6e8f67,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:ba78311a4664a8884aed713d14dbefac,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 83e6db70d47411efa216b1d71e6e1362-20250117
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 902497564; Fri, 17 Jan 2025 09:43:56 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 59589E0080FF;
	Fri, 17 Jan 2025 09:43:56 +0800 (CST)
X-ns-mid: postfix-6789B5DC-106682288
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id D15A8E0080FF;
	Fri, 17 Jan 2025 09:43:50 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2] ASoC: SOF: topology: Use krealloc_array() to replace krealloc()
Date: Fri, 17 Jan 2025 09:43:43 +0800
Message-ID: <20250117014343.451503-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use krealloc_array() to replace krealloc() with multiplication.
krealloc_array() has multiply overflow check, which will be safer.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---

Changes in v2:
- Fix Warning [1].
- submitting the patch again would be more appropriate.

[1]: https://lore.kernel.org/all/202501151630.VyzkV2xo-lkp@intel.com/

 sound/soc/sof/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 688cc7ac1714..dc9cb8324067 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1273,8 +1273,8 @@ static int sof_widget_parse_tokens(struct snd_soc_c=
omponent *scomp, struct snd_s
 			struct snd_sof_tuple *new_tuples;
=20
 			num_tuples +=3D token_list[object_token_list[i]].count * (num_sets - =
1);
-			new_tuples =3D krealloc(swidget->tuples,
-					      sizeof(*new_tuples) * num_tuples, GFP_KERNEL);
+			new_tuples =3D krealloc_array(swidget->tuples,
+						    num_tuples, sizeof(*new_tuples), GFP_KERNEL);
 			if (!new_tuples) {
 				ret =3D -ENOMEM;
 				goto err;
--=20
2.47.1

