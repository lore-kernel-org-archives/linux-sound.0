Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB417E0;
	Mon,  6 Jan 2025 05:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736140045; cv=none; b=okC3N+zkFfmhqIsAuFFQRZkAjHmFMCZfOXVq9l615oVyyTHVZzf1kxM4V5Yo0Zf4mQBqJhMEzT/K0UFcBZHGn5YSKWhD/3XX4+9ziKa93EtyGQDBoE0RtEroDpC3mSE9C0nhh0K4UpIbmFgY16Up0PUY0MgwhhmEtpg0sAz5Hnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736140045; c=relaxed/simple;
	bh=jRUYhxQ7NMExMlLwQP374k+zj9bliP3exrTVXAOWMo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XcAf3u5mWZUIHHuM8tAlTlOm2I8M9MOqZLnjuRX3e9o5tje1+yur2QLLXKiRdHz6wcKV/UA4HmYnPCQ1h+n8fSmuxY/17bj/5LCrJgiQeBH0Ps8jxZnP0uApZiBo3Q1vzzjlOkFwUDCv2OPAp1RGEVOFn8Sk1HiJqKqNIKWWeMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=KnoeJBS7; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="KnoeJBS7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=MIME-Version:Message-Id:Date:Subject:To:From:
	content-type; bh=IMCtKiq/bz5Kf6LhiUoK+HLLlZ+iqlss2F1pw7iiIg0=; b=KnoeJBS7GmtJ
	YPu1eFlomS03NjheEbywV/D8eRCFP1cXRT0mNI+wFIl5kYDwEBvUBQrSsfsnHZLkklMtREdgjz2OT
	zzBzQXJDsaqgNMMkgVGb7KRfYnheZwGoeAvmur6gVhSttj4VPHeAnlnnP3SGhKDx3KjeVh5VN7coR
	GOjezL/77LKXja/S7IsBnagN92wZrdujswXkgG84d63nzTESv0eioQGOnQ63AUNwu0+ZaeASx0jEN
	1V2U71TcpTl+e6sEd+psf+VWjqjuP0rFkZl2s9R7OwoAKfyC5QEzYEvijAnG57l49n25t5S5oABbQ
	RyDQ/NCWvzEVm4iuFHqd8w==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08216fbfbb76706e2) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUfKc-000000005r6-308G ;
	Mon, 06 Jan 2025 05:07:14 +0000
Received: from [220.233.184.101] (helo=localhost)
	 by CMR-KAKADU03.i-08216fbfbb76706e2 with esmtpsa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUfKc-000000000TH-0hjA;
	Mon, 06 Jan 2025 05:07:14 +0000
From: Stephen Gordon <gordoste@iinet.net.au>
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH v2 2/2] ASoC: simple_card: Show if link is unidirectional
Date: Mon,  6 Jan 2025 16:06:59 +1100
Message-Id: <20250106050659.57924-3-gordoste@iinet.net.au>
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
X-Cm-Analysis: v=2.4 cv=MYZquY/f c=1 sm=1 tr=0 ts=677b6502 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=VdSt8ZQiCzkA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=2_3RrZhEg9tCGMFQ2A8A:9
X-Cm-Envelope: MS4xfJWWeGDTY3xV8xTLwWtNakRvE7OrFWAP28LRBeMhax9aWAIcoCV5EiTBTij4SDDLeO7vdhuY1Li9WpXMMCtYJcA33cs/6U/oHqPDxtTrUgIqPhMN4qd0 2bsb/ibzb56yNAdjxfQ2V+u4ks7AEt7g8fXOyxb/UW+3PTJhQc0huf04jvY9dp8Rq6B8H9rNcJQ6MTCMHjsjJ9PenagDgMIZP38=
X-atmailcloud-route: unknown

It is handy to know whether the link has playback-only/capture-only flags
when debugging.

Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>
---
 include/sound/simple_card_utils.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index af79f680c72a..f6bfd485c31a 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -267,6 +267,10 @@ static inline void simple_util_debug_info(struct simple_util_priv *priv)
 			dev_dbg(dev, "link name = %s\n", link->name);
 		if (link->dai_fmt)
 			dev_dbg(dev, "link format = %04x\n", link->dai_fmt);
+		if (link->playback_only)
+			dev_dbg(dev, "link has playback_only");
+		if (link->capture_only)
+			dev_dbg(dev, "link has capture_only");
 		if (props->adata.convert_rate)
 			dev_dbg(dev, "convert_rate = %d\n", props->adata.convert_rate);
 		if (props->adata.convert_channels)
-- 
2.39.5

