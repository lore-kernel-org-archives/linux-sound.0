Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B483B841F
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534878; cv=none; b=RyX8+ary8s8hJj9bdX9oDKHRym2D7k20G3/3wi+M+qarA8d6pwtiHiEhaqnqjfRakWayWoHoHjUTrw8NZKFHMZLxAcuuwacMFGPcuJRfQTqOOkUkJodvDRzjfIjAXYmrbQUI0Fq8SKniF2EiJk3ZQw639O2092A7P8baFw6Ez+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534878; c=relaxed/simple;
	bh=cnhZJjul/G/ZTpHODnkmh6c/dIrJzdW84QixxOCRIBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxoejUspcPw3/FWDMZowfCHDdu+ndkDHgQCVaiJM5nOx+BLc3X2KgeLehVodxLoL3Jxb0ExRIR/8Mkr9qEkdpyxvQA0Cd+18q4cBew6AphIXpLtjxdv66w/mQz5yFEzZZQuxowgVDmY37Mb8P/emkmpVs770dfNxI5TnJNma4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6nX5oJ+; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6nX5oJ+"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc433d52421so295494a12.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534876; x=1790139676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=;
        b=C6nX5oJ+0SEtIeeHyVQlTxoZnCXGRWHAHeQqX2PyMeF4zR1ktJ6H+e9jQtxmw5HdP3
         fgVToz5uvLfEZLFqcBg3etYrEYJHnUevOn+ZQjSN9ADyGEveKL5wBr5g/KJ0DH/817rp
         PNBqs1bgMfN2/whVUY51EMBKjsVkgKkxaFBVmownEWGEVs7IDWbObnApbFNS5d+tHA1W
         AbmIB42oJKSCUSy51UTMqATsGKPEfXqt8DfYwjoIyZKNi+DLJ7UMUlYx3enlGhfbhLUY
         0urICw8VgDgsZehevDH0k6/QlKv5F8tvqmYbY+s59UUiYOb5GbqUzL2ccYOSZiZKG0Wg
         QL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534876; x=1790139676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=;
        b=FsA5g9UCFralENILmETvUNhFtZfphaUZt4W5K5m45xzZi8zLPei24O6uG+OMkqgbMk
         583TFTh2n6WmDQMAds9adhSe0WSvcFFFiNqz0pa+UAuzK79ox4LqeCzbo9wgUBRE4H5q
         0iLUy8ZY1ZmWz+/5m6JXASzPeo6ZYzboXUF1RSKmAqDPkC/JRa58UJdK0g/Ps8SffCPj
         egZjSa+GakhsvxFiCTZvGBrpBuRaaW7OrHSq1wBpb+EiOqMbNfvoK8mQq4XSolBjupf4
         ZE7CYAN+JTNDKHuFEOXeWuDfUEFspvF/vfjyLGuEUAdYj2zMKxo7hpjARYCmLpXrIKpC
         6aeA==
X-Forwarded-Encrypted: i=1; AKwUvByholzztCcA2MUUEL6RKpnfIyxk3C/K/7saIVRNxKodjtnEdnF8bI5eYteMmSwGKfH0G1sDRTmeXWApAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mTIyeuUUtCa+X2Zl95/OyxsBYq+LPyhFxdaBYh3BhSnmH62tUp
	zriT7/Ff19FuuUzFJVLZGe+uPlO0pPVAdZJ32u5gg4k64203QydhuOpL
X-Gm-Gg: AYBFou2pgiuVQAMroFME/NKl4auaWBRIZM0WOhb8tZGS2Ss7xpWC9IJ7rv7TxSDWBTv
	XNcXYcaAUVkgijMqvoe/DZoxlkk6eWxITndp761jb908xcfqy+O5/XW4/gcL6Sy8QQX2h3hwxoi
	emWr1h9aJ4mJFtrulHV2D9xeF/fnRJRda5Vamo46XJYlYZhN71dxIZ03ria8vCCt8Xub8gkNp5Y
	ChMdol7U4+VqBwkLLAraK7RqSZdGp+EJMvnCYvhrEViyJE5acwQJkZjx29A73af74M7/AzWlago
	47atuUQvxXAPrVIFW+blBS+13EuPyLGuHbRf9P/Bbk++iN4AyWXMYWCd1v3XMwM8j0u2KYy9jpK
	Pvyaa6+VfpKTl+PKUmAcTgmotL0Qx5PYpjigZdjU07FUsgB6kr/jYezQwYVTnFHLtsfvRdvCwK4
	nNqGuvBImz828tOrnvgaujmJlr4Sxg98wf/GPeecypoCA3TvinWQhLu9/cdvM2NA/oolC1ncYhT
	JZtmtliGprWTtvphwjs9TeSKf5TKjB/hFvShFXxnv3rUyBsPjesz06ReDFZMYCSgWOPQ/woV/tt
	8F9li3GcmrIO4Ts=
X-Received: by 2002:a05:6a20:d48e:b0:3da:1e2f:3be9 with SMTP id adf61e73a8af0-3dd5f720482mr3249802637.22.1789534875984;
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 07/12] ASoC: mediatek: mt8189: Remove redundant error message
Date: Wed, 16 Sep 2026 12:00:14 +0700
Message-ID: <20260916050020.14575-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() and dev_err_probe() call is redundant and can be removed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 39cc2804ad4c..11dba86c3e81 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2486,13 +2486,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2526,13 +2525,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2601,10 +2600,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0

