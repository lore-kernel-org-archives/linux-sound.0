Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D374C32AAC3;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154477; cv=none; b=o8E3ARHrpLwMvQHh1ZGqypoqFtjCkax92Zuc4hipTloV8Ey1HkvTxdolEgXguzLxNeCFA7QU2JJseN0UohDfNXieOpF/f6OCQEOHhyxf+s9p2w4IQpdATFSiO10a0LOl4AxhwQ6ciE3IHg3DaAp6KLMAqdRse+qoGdkvWj+umFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154477; c=relaxed/simple;
	bh=67Eabwf4Haq7pOJRL6UwOk2Tu2NXRhLIGQuWuOiVerc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOWGDwVmEAzNNb84CKf3c2R9A75bZP86Jf2tdRTmBx7HIVdh3neFGc6PwYvzrbjZDYQ2XlGfj52DGYiCkTieTCp95YJ1c7DRxMf0sMzLWpMbTjsFhpai7qg8hma0K07Q5pI98iGK6MAquoZ/El3R+OOhriW2/RgpaA4AT91MJd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8bL1xas; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8bL1xas"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1D3C19421;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766154477;
	bh=67Eabwf4Haq7pOJRL6UwOk2Tu2NXRhLIGQuWuOiVerc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8bL1xasgE/i+sH4uTofdRtlbmtxv7E3McqQ+iNBSXBXEl45AZpPJbrs4dKT2nDXg
	 GfOZne6qN1uQ1HVM7lP1prd0eAp8dbwMy/MH+3u47HEBnpL7qyfBTY+o12tt2QP0A0
	 JrI9ScYNWbZHszzd3yQSwyHUSbrrTSOH0iDWo8ZGK4FulH6wxto2T/ww1m1nwp4Kij
	 PSImf0B2Sur6YijhEmF7YlTq/lwnHewdVbIdVZ0KqTFkArHe4dHy6QfhliKsOS2ijw
	 oyCM8GiswvRhq90w3osmLKJmBnlNYsw4KpbVNGbLUNK3XW5g7WDEUmqRpunpqTc2ie
	 hp/i9acAfCQbg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWbSW-0000000051Z-1tOB;
	Fri, 19 Dec 2025 15:27:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH 2/3] ASoC: codecs: wcd937x: drop bogus container_of() error handling
Date: Fri, 19 Dec 2025 15:27:14 +0100
Message-ID: <20251219142715.19254-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219142715.19254-1-johan@kernel.org>
References: <20251219142715.19254-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_to_sdw_dev() helper uses container_of() to return the containing
soundwire device structure of its pointer argument and will never return
NULL.

Fixes: 9be3ec196da4 ("ASoC: codecs: wcd937x: add wcd937x codec driver")
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wcd937x.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index f4dbcf04be49..10a2d598caa7 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2763,11 +2763,6 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd937x->txdev);
 	wcd937x->sdw_priv[AIF1_CAP]->wcd937x = wcd937x;
 	wcd937x->tx_sdw_dev = dev_to_sdw_dev(wcd937x->txdev);
-	if (!wcd937x->tx_sdw_dev) {
-		dev_err(dev, "could not get txslave with matching of dev\n");
-		ret = -EINVAL;
-		goto err_put_txdev;
-	}
 
 	/*
 	 * As TX is the main CSR reg interface, which should not be suspended first.
-- 
2.51.2

