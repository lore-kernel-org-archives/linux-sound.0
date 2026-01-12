Received: from sender-op-o18.zoho.eu (sender-op-o18.zoho.eu [136.143.169.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83726CE2C
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 23:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=136.143.169.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768260970; cv=fail; b=kcTwn8j2wJ6hsR8SfPZOdJdz9rNg8ue2yOIaOi++N/1WdD/iDKdspIjxRQWazG3D8izIb/uMHFvmVqvABXj5ArYodpea5RkeLgKEfEmi6xM7djFOpObrW8+/diHEVYQ1l8nG2dL+8YJB9wPTiXTCvQLdUKrdhH8iF7DYvfiz/YQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768260970; c=relaxed/simple;
	bh=2lNNZyVcSEhfqQ1JM0hbJ4lXsHZaZN8CkTusTkV2fJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYmmv0CeSnUf6ZIJQVbhYa2k2fsv8vUbf0G1Nr5wjqzT8IpquxBSYKl/gNOAunycu4Zs8kZmEPm/m2A19PvKABUtg2tn99dnmP77hP+gmeCZ21BL0hTb96e/sNzMc1kk5XHgAAHoXCZc8p6PaiUcAsCZDTxbWSjkXsyTnBsRkW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=MlgL8lld; arc=fail smtp.client-ip=136.143.169.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="MlgL8lld"
ARC-Seal: i=1; a=rsa-sha256; t=1768260027; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=HJbjk3wXShhE2eQNVmbxN9BZ+ZnAdZl3nwRQ5E0tAe5sYYOdxYyY0tlRze768zrHcwZ+1cPUtRPmbzpXLSBwdRHIQY3ww0CaXCBq49rYRA3DAaTtq0pZjOdFvVm0xwnt330vnT4x8SJRdC3Ped+l3KrNnA5kB5r9LOLppFufA2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768260027; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:Message-Id:Reply-To:To; 
	bh=ZiCdlfnSAuIfrjfP9jnHbyyHEvw/Vv98d32i+eBqpz4=; 
	b=HqnaoyN12yCDI75GBaOQZV2XFwqKW5MtX5NiCAe7+zJBNnEZ3soRivN8T7Zg4Uxge+fPpK7Rv9Cbsb4MKCxtTnk0MCb9VQ2LmzShq7jUFj7v1/eixobe4kc/mcZLcpBL9+72276SIPX2oHTyTN3uK+CGBtOzUMeq4KiIXDVxFJs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768260027;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZiCdlfnSAuIfrjfP9jnHbyyHEvw/Vv98d32i+eBqpz4=;
	b=MlgL8lldh1J+KbSO6NXLIbuf+T6J+yqCQf0IZ3OrwtmpeNmv/EpykXttwPwBAmIh
	t55iQozmBmxFc9uKcxymi4Lw1okPAMsCbVTHhEWCgNI//EHCk40Yez8iZBOi+m166G1
	7nuvhNSAVVgsMnWI9i41a8kiKFawTCxQrSke3S8g=
Received: by mx.zoho.eu with SMTPS id 1768260027520443.0365422851705;
	Tue, 13 Jan 2026 00:20:27 +0100 (CET)
From: Fabio Forni <development@redaril.me>
To: 
Cc: Fabio Forni <development@redaril.me>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 1/3] ASoC: simple-card: Do not print "parse error" twice
Date: Tue, 13 Jan 2026 00:12:22 +0100
Message-ID: <20260112231855.193030-2-development@redaril.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112231855.193030-1-development@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurred on line 747, we'd print "parse error" and then go
to the `err` label, where we print the same message.
Let's remove the duplicated print.

Signed-off-by: Fabio Forni <development@redaril.me>
---
 sound/soc/generic/simple-card.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5af6d1b308f2..8d36cbbfca1d 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -745,10 +745,8 @@ static int simple_probe(struct platform_device *pdev)
 	if (np && of_device_is_available(np)) {
 
 		ret = simple_parse_of(priv, li);
-		if (ret < 0) {
-			dev_err_probe(dev, ret, "parse error\n");
+		if (ret < 0)
 			goto err;
-		}
 
 	} else {
 		struct simple_util_info *cinfo;
-- 
2.52.0

