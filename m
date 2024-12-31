Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C342070;
	Tue, 31 Dec 2024 03:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735616378; cv=none; b=gD4MltM8kNJJc/a+c/fZS015r8nZ1S7znbAUWoKDAh60y3K515pFfwTruV8/O181xYMPehGnZjJ5oBG9s7TzHFyVgQeZ7RVp+JDYMi/Ke02sUxY2kNPD4C7ewoXL6izF7yY3JvmkhTkKzFtVS2/8cyATJv91kqc/UbgEGmzqo64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735616378; c=relaxed/simple;
	bh=YDBqG8ZodRei6EMnn7YHhxSXmHKiCZpuzRzPbzsHWjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QTpiH6p1y1IREuIzbDZvZ9+xpSjIKaEhPQ3XVxA5GjyI6KuG3JoZsvzuq5zRU8RWjVhlUnOCJLKmYzOWHYw7fKLlj9O7TBSJndOQ0c8YfqnYATSNEtUzH87u9drWMnJv37fsitwUlIb/LngLFWpG43Ggrq3e4+N+sHcjFAqjuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=jvrswkXa; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="jvrswkXa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=MIME-Version:Message-Id:Date:Subject:To:From:
	content-type; bh=fImaNO1Onx6YYT3AQQ+ELeKQYxi7TfonhPqKCCFip8w=; b=jvrswkXa/Vio
	M374ti/Zzytd6hadC3JfzmIWhYz4S5YQ7Ti8b1doJXMVvsfrFAMcNxl1rOL+ym/3FXwe4RNYenkql
	MqkWuoHyDOzYOn2XmsXTA0k4iiA8EjpLQ/08CyGt8N9hAYAobOGBHiYGHGv3a3EsLfnHRmmPoXTOY
	JfYB2EvQwYnBzUKRFK3CpbMHelScixZinuW3pwUFX8xBjlyExVnfR9QpnS/pmDEAFobwf5zoSl+Zr
	a+oI5tQLt4OTM2zbXo8E2yxrdYFrKmvIqlG2EJ95i+QlH+AT1sHqJoLE4r56JGmUmD59Sb2u8E7nB
	GIg8cD1saET1aWgk4Pri8g==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08216fbfbb76706e2) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tST6S-000000000v3-3qfE ;
	Tue, 31 Dec 2024 03:39:32 +0000
Received: from [220.233.184.101] (helo=localhost)
	 by CMR-KAKADU03.i-08216fbfbb76706e2 with esmtpsa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tST6S-000000001cK-1w0W;
	Tue, 31 Dec 2024 03:39:32 +0000
From: Stephen Gordon <gordoste@iinet.net.au>
To: kuninori.morimoto.gx@renesas.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH 1/2] asoc: simple_card: Improve debugging messages
Date: Tue, 31 Dec 2024 14:38:40 +1100
Message-Id: <20241231033841.6213-2-gordoste@iinet.net.au>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241231033841.6213-1-gordoste@iinet.net.au>
References: <20241231033841.6213-1-gordoste@iinet.net.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=MYZquY/f c=1 sm=1 tr=0 ts=67736774 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=qSRHBturNNxlZSGQuJ4A:9
X-Cm-Envelope: MS4xfGUJFt9yYvhO4MfO06tbE11EyLAYXR4aC9xV1fRWIpQNL+alh0tBjm72I8Vd2SftRIBkxVMSSFk9W7hlK/d567uMHM2DXLqepC678nQrumBFS1RNQID4 cu+mcYhGZBW+Wi+uibtalfNzdQsR1nV65AygETcaIdXXEVHXNKlrku9BTWAubXcA4LXgOXDnYMnATL5tPNxXgsS6d9NrLFPLN4w=
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

