Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044533;
	b=N8ZrqnVGJvWkrgNHXFjQbNcFKupeqz/QwYqfvwZDxn7b4pyHv+L2fvLj/IVpFQ/cOJOJ
	 GIA5PGXdJVFa8VQGHlPeUsM8IXJiRgMous4/o+rxgbd9i5yCyhtFV517DDBQOAzj1GL1l
	 6KBVaAXcyzbfPpJsPECVjPLYKj5swlSiGhK4emOAnX/U1sW0IdL6o5BkvpsMT7X8FMHwi
	 jixdhhdHXb19gRPBgSRT838nOSHHYRG63gNEswC2stGMTAtVoCk8dJZXmcRb6Glwf7sK0
	 ocyfp/lbiux0W9XPLuQRgr5XN26J8gERayCwhOiUYn1mx16D/UOUBC7e39/7fWQvhdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=TDHZ5ZCxD3v5KFEAcCzksoiT31m3Y/a+Wi29UHlkxgQx/4F+4wp76ryMIzD2fctbBn3Q
	 XUrl0qaT0QsFxCyeauZO52YpOtNc61j4koCkOkqRDbaG0jNg8v9BPOBrhtP5EDf1lpV6Y
	 iJO10i1XE1p2zvwPs9DaU86h/7sM9epbhHnm3v2S1ggKOUby2jAuo8GobVwbIzXe1YLXp
	 S2CzBp7GNWeeRnnZ5HoTG3IZZsaGdlSqr8apSqDnCuK/ZGkO+qU0s2BvW2FsuTJEn0S6f
	 ZMwb4jDpLYW3B0w22eWuRDRI2GvxGIY7TclpetnJ8vE1+KHhOtu68svlvarmnFFrJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKGlUFc4;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83498606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83498606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKGlUFc4
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1906051eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044533; x=1794649333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=hKGlUFc4qgAhuEcENEmaG9xvGFtU6oAhzoWwbgU1bV3XkVQ/4XDEJH4qIhh95aMacp
         IT7lmMKK1g1eIHQR1jgmlkXJwIi2N8ZOLZIuui3XdVSt/CSNU7q1UCcFoKMCOTzSgVFs
         J4FkhhR26a6/s5g+idsW29pJNs+oOTMf8OmpkdiCIvz2GMYJix1HWTmwEcXVcHQLwucJ
         JudQ/g1xggwB5f6A7/DXLv7ILI4oH3Ov+o7G8bluYIF0tSzHL2q8IyBDqJaEmmOrk3Ao
         O85BpHrVK1+a2whVa+aT9K9RHJmgoapL/2HyZs1PVyVMzd4/l7GMvrq0kLFYAUSPueha
         IV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044533; x=1794649333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=QkmhTSRHXcYuFWRSU0yBblR3JbQ41iBh6K9i/+IW1Ve5xcuWrgMS1bYoVmnoD03gxw
         mTJb1sMEjCx+854dhihhEpedjwLk6ZHAdrImj0q4up8VSwNYEq/QzE7MtmB5qw2C/S0M
         M2yq1DFoBmkqjhnZTIYnc6DfQNVnWP2biJF4byzbSm3EiUqEtooulcE6iGvagfLV975u
         Ssvk9djVI72fbpFunCFOtoHHgiRNhyQiwdOUkUaqsBbSfQQc/hhycdSVaowoFhAjGbjp
         e7/SP+VEqZaJHIXMnLsJzbj3z63XU+3peA6yGdKNnqDSn7orYxTxFk3A6idX4Az1TuXQ
         SZjQ==
X-Forwarded-Encrypted: i=1; AL+hErFK9i51JKOICR2PdoibAQhliMcM8JnFwTu77aGWpw/fuG6eXpXgm6Cjzo883kBPzHG15Ivdow6EPSouug==@vger.kernel.org
X-Gm-Message-State: APuU4Z9y3dlknYmyOJZhZBUadUTzKzSYFxjPgSrBIgCICCfeZHumzv0w
	Fxsp0Ver4+/nfAPyu8uJx2CdsWJnjeI6dxE10DyRUXkpWwzpUfJCFHae
X-Gm-Gg: AYBFou1o9AWRaxgFOXz4Q5isUhpBTmCIRhsuTx2lM8PfnrHXxN4dAArjllddOsXdByM
	fvsGEf6Q0crdk4KnB+KgO6zsZCL73op9CRSLwP+KFRMTjpBpD96X1UzqbW/Cgeew2bmlQZ9+U21
	XyG0PDzunI9oCKbrQm/VIB6HJk9mB4OVShJ+RZL6noGe+tc4mRgiUrlnTP5nTRpg+5zvEB2tHKO
	SbSzq4ZMiHfzVkhrRFSLN82S3/idV/2rNkBtySTaVWST9ZU97jwuEViWF1rB4tLFKAaEP4JgU8R
	LVWPSRQs4/yp10AhnrTYxpX8uPMyEc547v0pMdK3YOe7BzFuiWXsbuFn7DdNnBRGQHlVBFUsdDu
	Rbzmv8osINSif1FOwCMbVrqthDH7I61gfbXbXWGtXX45SVAWURL2YjDGFQgFnAZu011i5cUWl/8
	D3QWXhYgatfgLRUBeE1sV5/CUSeHSw7Og4CL7dNJxs+/V+/8ywoN5v5rAS6bG56qHnNpMPOGkUQ
	bnvK2USKpUYnzUouJ4SGtkb+IVp7tCioD2seI+SihN52SfztUYsllMMEc9NQU16rFwuJzmzMDDN
	HfYkO56CGVsIU05XmPkpKWqQg27yNJ7sbmsUXfmS7BiL+gHHxkCy2X16B+pFEj6h0243pDqBo6G
	letm0ZM5+aRkEzvW6YMZNZ+PPh45u8Wdz2VjPxYIF
X-Received: by 2002:a05:7300:f58b:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-36f75253776mr7263853eec.6.1794044532550;
        Sat, 07 Nov 2026 01:42:12 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm19185908eec.6.2026.11.07.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:12 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] soundwire: sysfs: Use sysfs_emit_at() in array show callbacks
Date: Sat,  7 Nov 2026 18:42:01 +0900
Message-ID: <20261107094201.3951903-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-3-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-3-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
