Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEE2F2D;
	Tue, 31 Dec 2024 03:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735616379; cv=none; b=it5l6XKTn7kDIqI6CbCMQtR0i2nxKN1QCPhdHRkLstVXYFuZ97CZR6GaLYHVCXIxsdCukZIB9ZWbmo8KDrHz8Sf39jzFwpyG53TUnMoMA2b10nqZhFLVqqdrjC9WYZkUy3FL5L9FT/jBAlUD9HWqvunGhBjfRzXopIqmA8A55IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735616379; c=relaxed/simple;
	bh=Cncl9G9eRanQfPbAaqAZW555+HnTLe8jdg+gyFwpXV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RjbF8G+BgIg+OT8chf24iDJSS/2cInPlR5dZXURq6HbwQRBKJGhdg9lQZk4+YSHWpUlfvFDW6SzcU2D5/H/nLDR+ftqMgAeypR/+iafrVJ5O8dW3kjyQdvYtpkAfgqPTEayXkrdl6bn8Au+PIIQ9A6c7kfKMNcCdNBuBfzEi5uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=Sm/v9S+m; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="Sm/v9S+m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=MIME-Version:Message-Id:Date:Subject:To:From:
	content-type; bh=JMgZsoegvnQ7z9QPCeedtvGI2rxbtmdF/IYDXAoAhgs=; b=Sm/v9S+mDW9K
	r8k9ErVvwNhFdRZ1xZeUkdiCXDM+WjXiTGHH4fQ7TM2Ovr6minF5MOsgHQ/B0Ih2Ic7se4yMOAL4Y
	k4ZZEL5y9v3rpqhg/pXi67IugvmK8Reu3/0Ybl5Jj1Stn0eyL8WSq4wfial24sa2qO4Jv5wj5a5/f
	WQk1oPHhC7LKIuMdWCVD106ttS3vMdMvhW/DNRNZNuaoH/gtNVZNMejiJlx0ebKYSvVctg9tJo4rP
	574qeXFLRmYGgw4rWTavhoP/C5AkOkiEnL52ajPRm14+ASkjmXhGJWZ/LuaAt1X++O4FfOnFBdI5y
	iaaKdR3gJbIoXkGXV5xG1A==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08216fbfbb76706e2) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tST6V-000000000vP-1r5A ;
	Tue, 31 Dec 2024 03:39:35 +0000
Received: from [220.233.184.101] (helo=localhost)
	 by CMR-KAKADU03.i-08216fbfbb76706e2 with esmtpsa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tST6U-000000001rz-3oW4;
	Tue, 31 Dec 2024 03:39:35 +0000
From: Stephen Gordon <gordoste@iinet.net.au>
To: kuninori.morimoto.gx@renesas.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH 2/2] asoc: simple_card: Show if link is unidirectional
Date: Tue, 31 Dec 2024 14:38:41 +1100
Message-Id: <20241231033841.6213-3-gordoste@iinet.net.au>
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
X-Cm-Analysis: v=2.4 cv=MYZquY/f c=1 sm=1 tr=0 ts=67736777 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=RmlOj9MxOW-3h32qYIgA:9
X-Cm-Envelope: MS4xfDTGo1e0m87kIl+BTfWz+B+SCf8QHC7yilAapTorUF6ycRsZnsCp0MyxBPtzwXmm/iBboARJGmjlQUWHBBIC2VuiJMrOKhaT3PPqA65htHIujXkua8Ij uMQ7kWsd8cHQDRyYeu0Ol8oI/QJdFfEdsSMjQYG/qwPit5GB2/LTYcxWSwOee6mi8UdfVTJaYiZZ4xRyc+zzgET503UNKsF3XJ8=
X-atmailcloud-route: unknown

It is handy to know whether the link is playback-only/capture-only when
debugging.

Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>
---
 include/sound/simple_card_utils.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index af79f680c72a..fc149fc18ad6 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -267,6 +267,9 @@ static inline void simple_util_debug_info(struct simple_util_priv *priv)
 			dev_dbg(dev, "link name = %s\n", link->name);
 		if (link->dai_fmt)
 			dev_dbg(dev, "link format = %04x\n", link->dai_fmt);
+		if (link->playback_only || link->capture_only)
+			dev_dbg(dev, "link is %s only",
+				link->playback_only ? "PLAYBACK" : "CAPTURE");
 		if (props->adata.convert_rate)
 			dev_dbg(dev, "convert_rate = %d\n", props->adata.convert_rate);
 		if (props->adata.convert_channels)
-- 
2.39.5

