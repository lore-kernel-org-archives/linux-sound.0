Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461C35952;
	Mon,  6 Jan 2025 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736145406; cv=none; b=fUILcyQKZjrqOFm3pMit4t+CFk41vyGP7U92pGH7bOu+eut3w99YHL6nVE2ajwbrqPPkxf+WjRTQQIl8ugGan3FQZrAV5JBmbVPEQBlDvcBweh7WMPQMWCHTdLmePDCxzD3BNyuNQTBxm/eDDeKnI0SzYo29VNNaZ8nENavlge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736145406; c=relaxed/simple;
	bh=YDBqG8ZodRei6EMnn7YHhxSXmHKiCZpuzRzPbzsHWjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLzjLYbZjczi/no1qF2uno67btxQ+ZbIIHvM92ovXIZNP8zbKovOQZ6M0PAMde7+Z6TGEucDE/CqVaj0AHOrDJIs8RvNz/AkE/q61EpxmWzr/ZfIv0AMDTq7izLsmE28opqM0UtMzWQrxWZg01MnQ7RF2mc8LOigfOl06tl5l88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=SOakZ0QZ; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="SOakZ0QZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=MIME-Version:Message-Id:Date:Subject:To:From:
	content-type; bh=fImaNO1Onx6YYT3AQQ+ELeKQYxi7TfonhPqKCCFip8w=; b=SOakZ0QZf7Kw
	rb36bAasRgCfMn/iYSe5QLjhhQfZEvzje7ZLxWgrQeQ4EzOHbvnQhxZ6zUZQUjEf45drs9j1kHiMU
	IK5SWYusSCMey+oVhGmtJIFghv/LyAUB51kF+VID2HK9X/akc8aHTdXxwkld+8YSWdu/yP05ie/a0
	9knwnyVXtRReD+BpnEMFT0yEZGwJV7zvSwvtLJfcTBVgm07OnZW06Z5n56HGp9bXavHiiwlaR1HzF
	/1davEOdAZD1VzZUvgtKRZFefgIhZftBGj4g0/buI35A0wC7Xz/GqLnJzMdj3tUsd53xO1L2+PmmG
	FnfPJgLI5tkxfbAXURj91g==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-0cce97f01b2d699e6) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUfKZ-000000000CX-1Pmy ;
	Mon, 06 Jan 2025 05:07:11 +0000
Received: from [220.233.184.101] (helo=localhost)
	 by CMR-KAKADU03.i-0cce97f01b2d699e6 with esmtpsa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUfKY-000000005np-2Zsw;
	Mon, 06 Jan 2025 05:07:10 +0000
From: Stephen Gordon <gordoste@iinet.net.au>
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH v2 1/2] ASoC: simple_card: Improve debugging messages
Date: Mon,  6 Jan 2025 16:06:58 +1100
Message-Id: <20250106050659.57924-2-gordoste@iinet.net.au>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106050659.57924-1-gordoste@iinet.net.au>
References: <20250106050659.57924-1-gordoste@iinet.net.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=WdsKaVhX c=1 sm=1 tr=0 ts=677b64fe a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=VdSt8ZQiCzkA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=qSRHBturNNxlZSGQuJ4A:9
X-Cm-Envelope: MS4xfHXXG3pmW0cXQnOSakMhpu8zOJQoUB9jrEL2YqJRE80ZDU7L6UvnhzzCtwd7FRZxkG1BvhgYzRfWyQznK5mPiiwMEttGApJQfrLimpKSOo6Z4nqWzNCY tFHx5fULmi6Otw7+lGRLNdNMdjZB+4YmVxSr7D7opWoc8iUwx0+88RZayKZ1FhUwd9lzxlYJ1E1zm15YCCw3mfunpW8sicGHI58=
X-atmailcloud-route: unknown

These fields are from the dai_link, not the dai.

Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>
---
 include/sound/simple_card_utils.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 3360d9eab068..af79f680c72a 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -264,9 +264,9 @@ static inline void simple_util_debug_info(struct simple_util_priv *priv)
 			simple_util_debug_dai(priv, "codec", dai);
 
 		if (link->name)
-			dev_dbg(dev, "dai name = %s\n", link->name);
+			dev_dbg(dev, "link name = %s\n", link->name);
 		if (link->dai_fmt)
-			dev_dbg(dev, "dai format = %04x\n", link->dai_fmt);
+			dev_dbg(dev, "link format = %04x\n", link->dai_fmt);
 		if (props->adata.convert_rate)
 			dev_dbg(dev, "convert_rate = %d\n", props->adata.convert_rate);
 		if (props->adata.convert_channels)
-- 
2.39.5

