Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153180;
	b=lOixeOmD98uW3I1ItvtAJAx7vhy1koLo6C+MgvvS7XgOWltJg4ua1Ym71MHvkBMUqCFO
	 ftyknTQAW+mKs0/ay49D3AYLSe5Q4i9htxJMUnE6KqBoGBhykKBxLcGfNrlU7JhxmiJyj
	 P1iez/hih9WsFw3502HQckuF5G1V41JkqrbOmVdl1Vo3CED4rlsnas4/RDQ4KdaxG2X0M
	 RN9KRi0ngmSzbSqp0WLcFwJXxOqn7fCMzDr7YvhoJvKLRvp4ueIzYr1JGBhBaHZbCCag2
	 o698EqV4cMUCHCBB6j9L97LLErvo/OJ9f7Lj6ekDYYqQgVwIIPOJMeITKmWSC0gAxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L7t90Gp50CJsq45N8IIrZJkt4c6yFoIowy7rFMJkWY0=;
	b=Hh/J/ov+pa4wS0TRuXJKNfVFn74MjgmvgYFeXWFV+7ZvByq7doqODaBAflBIirqukATN
	 bXod0jY2Zta6KwkyF8hXCjAB9Tl+f36UavWQEKL9OhxSfCcROEEGvnq+tifqRYKh1VKiw
	 9gCV7kxgc7ZdWkSQvRuupRX4mmE7BCIi4EOyPmFeYrrIis2wi2GbQ8IrF+ZFO6O5vnQ/M
	 UIBz+luU60u2IbLLj20htQ0xF8JJ2DCtmN3lya6rZbK3mFHDtFCzWzFATbleeFPFmHrNh
	 8xSTQL83koGfIElkiPu3k46l37FYHpZjx9MfhNmSxzLRCqb083CTd4u9qRV4hjwJnjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDN8vwLW;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F8606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDN8vwLW
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-823e4047037so359692a34.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153179; x=1793757979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7t90Gp50CJsq45N8IIrZJkt4c6yFoIowy7rFMJkWY0=;
        b=KDN8vwLWJuhrWOtXXKh5uIiLdMa8Uu3y0MIEQTp/3Ih0jY2IuqaMovyPW0rR8DTTsj
         bR/ZSUIHzERtb+n9yiKKvJ2BqgHtmFkVGmz8Z+jk0cI73EgHPgJ0R8KlNQvCaJUpzp5i
         374VGAd3XOkr/9n4p9WZaM9JA/dTQpkuoBQRcv8U6jJosC5+L9jvKmpWh/waA17Zy3iH
         K+0WT9qITzhKZWKBOX4r94ZmxUf0ey3bEu+3NKQeoXElzfqI9rWQ2QPwNxxs8oNEM46I
         9XN1QSX7OaWnyjC+fM3I3UhRiVD3GO+FYJQakRVYtgU5hA6C4DLbMCUENVHLaHnDFaqm
         coog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153179; x=1793757979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7t90Gp50CJsq45N8IIrZJkt4c6yFoIowy7rFMJkWY0=;
        b=Y4uspMRRHBcLldkQmSRgvw3h/j/J9HKfjPqyfkerkheirwqXXuhrg64tI5u1Jc1Ico
         f7mjhjK2Yuf1PYV7FBBw5q/oS9Thk/wd0gacawbYWmlyQVJaMkkBrY6BnlgtWUdYru0g
         NdGm3x72LnPJMUth0D6lG/elFesHznAvZrphCrzfQDMOEhL01D1O5yl8uJYUd3VuP2A2
         IgL+YXQFQGRqGhp9GvdpJ8v2QHqguib/ctXUJff7d2Os061x30e1gBqey2A9grAEN8zS
         z68HnN/BGkMAV78Ydq741/iceibUJAZEDpvIcYo7Sx/XWMTxz20hwBmnrNM4Cey8u/+e
         EibA==
X-Gm-Message-State: AFq9FYK2X9toQAf2e9odx2jlxSYeJo/202VHIfB9LFL6LTz4G6e79Aeq
	VedZzO8SXD4ngVsxAWYkisUrHLkjaPlFMwRCQsurcFKfPEuvXjaHVb6qn/YfcDnITHQ=
X-Gm-Gg: AYBFou3W3fcVR32RIpPjKZOoKfxEikiHZsx40pWAs71b0fM6ycLfJ6di0WL3zpMP3SG
	9XwSyuwr1gBl+jxx2cM6LbUR5nNbCqg9l/7ltHXtVypwN48fkQ8Kmode6dsjGXE9Wc/2mA03TkN
	Iyf1hQL8Zhbcg8QJH+u4OJsP4wObvDtQGS1ereNleR5lRHpnZbUZiYm4vLDin0MOad1+FtcCVIU
	i/SVmf40NwCyCuYHU/ZJkIfn91hKq+5HxkpcHXz5InQOBCJq1/EzmcsWIwu5L41bbVGUjEnwDtc
	nDeIFtjswvpPwSZhbRYbPv5xYB9cFB/fIeWdY25YIfZGmyuq9HfmK7y0iq3vgh3MjqTyAwAdZAS
	eO1AldR7kOrtJE60YDSfp/qk9WjEepCyNbUJau/zJC6JDWVU3P7EisqMmeUL5uqfkaUm2sRDe7P
	kDZ9j3UnL98RZC/1ZL+lR4ShCpOWap4c2TrTa8dZXKuZZucQsW8DoYiXb5Srrhy/3Lr+NFvHt93
	JK+gruqVoN+GJ1J4cVVNxxA3kFeUceVbqfKv9r+LuUjL0v5y4KhVS1G5UsXSykKKa0JKigHDtQL
	hjfQ4TgEgdvTlMZyiKe74T3d+vy2x+c6XuZ/8aZvIdJjfYBFJqCppRMLEyLsVlKNfYImpgT5LJF
	gWbjiExVsOAMEqhCzKdfIsA==
X-Received: by 2002:a05:6830:2e10:b0:844:a8bf:7dc7 with SMTP id 46e09a7af769-85abd12e702mr1155502a34.17.1793153178800;
        Tue, 27 Oct 2026 19:06:18 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:18 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 1/11] soundwire: amd: add ACP6x PCI revision ids
Date: Tue, 27 Oct 2026 22:05:42 -0400
Message-ID: <20261028020552.35278-2-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PCI revision ids for the SoundWire-capable ACP6x (Rembrandt)
audio co-processor: 0x60 (ACP6x) and 0x6f (ACP6xR).

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 include/linux/soundwire/sdw_amd.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 470360a..3ff8e51 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -27,6 +27,8 @@
 #define ACP_SDW0	0
 #define ACP_SDW1	1
 #define AMD_SDW_MAX_MANAGER_COUNT	2
+#define ACP6X_PCI_REV_ID		0x60
+#define ACP6XR_PCI_REV_ID		0x6f
 #define ACP63_PCI_REV_ID		0x63
 #define ACP70_PCI_REV_ID		0x70
 #define ACP71_PCI_REV_ID		0x71
