Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135503;
	b=vCRrTCVS/DpF8/4ODwR024zRL8L6BvrHXYOZm8BJ0sP83NYc9gwKAsB0BvHdWpoWTQcB
	 ukQNHBzGYAZcAqHWT/M5DW9yAAS1fPL2HSmVqjpBcaDFjA7Vd5QtXqVrYAK9rnVJQrg+6
	 IOZR6hez7sMJKPN3t3TbKO8ToNdI0+Ib0mQQxc4QvzKPsAZKPdKQaZL46g5gAlcIHQ+pM
	 L0Fa7N/7kp4EpNAWjwDQZc54mfmhuO+1Fihpa3ELZH9250zF1vhzu6aW6TxBCA2d2T3ob
	 6iruFG8xdCXDTYHglyEeVNn0FFRX9rtpEhP6Jv3b/u8D4LQbg9LIPTHhHamam2NiNYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
	b=rPpVIqpWiG7X9cBYJWLCC+Aq4jLeN48cX0b/FzUEekqOjSS1dt7LQwtN5JhAHU10haRz
	 PCIeKCwv4Z+8AVPbQMVaYSjmhiMpQp6RaJ7DuPM9kP+k1VRwvPIar4LpOiP4T7VxV/xUe
	 Hic+CbiknPQFsZPjTd+N+DhRVBIaaCAiedzhiEky2zplI5WM1zleUML3o/IqXXTn8myPG
	 NTICPeeU9VVDZL+Y6cNc7CP5bY+koaThDD8qQB1wtZHiZhmzJpkTElXcIIe/b+xcLWt9o
	 6il5yY75D64Pzg2/TazzqEQim1aQUOTeFBjkD9qC2fJa3LyYtlEfu/WT8wVTSNiChJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihBLXm4E;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD8606A336
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABD8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihBLXm4E
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4aa5833c263so227728f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135502; x=1795740302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
        b=ihBLXm4EXEgDv69ppDtXRHTWiCY1l0QwWi/p+mM+6LQibxEmZg2zTSvdbRQkXHIhBK
         d4IamreYYdxlCyWO2KioPjuwB6VO/cujps5G8L24+i4+L3Dsopu+2aLJEXMYxMBWq4Am
         e2jZFtIP6YzRYU2Zf4LboxWDah/0toYjfhsp25Ddb6jbqn1RTYBmnnyq1TLNCf0uEJnk
         iXrVu0gHy8dMrUJVil7ONFT/IM1wJbAsI+lDggt6AS279MdTjkpZoRaY7pNgvFExtQya
         G2bjvI5yNlQR3yX1O4wVeiayvYJ0eFzpBbxhqmS9s53IosmDV9Oj48hKfNnNIYlbDA9Y
         xt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135502; x=1795740302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
        b=GVGu9YFapKP49egR5v4X4vkhLXRmipQgP2mGfN1PqSPvdtA2a+/StIa6JpyW1ykSIV
         kF4YdImaJ/rf0gkZV4qV/DQZDx9bMf+YW03LIAiSj/ehPebyHSZEtE2xe6mHXa1vFfVO
         3RnZ0nJItlidc2HvFwDXRVG/eWwHATRO35liYPWuVabvNpCyFzA28uEX8NuhoQ1hKE76
         CSlber2S4ix6mZ2RRJUNdJUR0VF9QV0ShPkwa3IIELy0fpRW2anBrDYsMfYCUEXNcrkq
         uVeNHzQ9e4KFnlLlQJoECdmvwiTvsIqE5q8xfizNjMRkBgHsxErgvs+3i+s2SY3J7alx
         hpJw==
X-Forwarded-Encrypted: i=1; AL+hErFI7kfEp1519Z1Go6pJsZ68u/4H8QAKlJm2FDuT67yq5qFnaFx/66siC+aJQ9oe1VLr4AvPapwpGCM41A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JWVhXqD3DJI39UUndBCqdrzPWeJkCeW0AWC7V+2KV+34V8ZHF
	ManApgayqGTp35rXAAQnYwXKrg8RVl7IRoglYD1Oh1OJzANjee83JZCI
X-Gm-Gg: AZFdTZd5wFR2t35YbxFvXK36fEqIG68wy1gfDV1FRhlXr8wbEcMCSz6yss5vXfNulzw
	CMbArS0Z7cVeWwCNYvI0g921l8v45Np+N+axN5qsAGuotf7uefHrN1vjD6gqTXltX+aE7+lSphu
	qJ2LV1q/jCe3vd+z3oYsYGUSKkXXUYAm8oB/utbk1rAKCbikYUcOkVzfA67PnwK8i982H5SLoqB
	3JZW0KpYe/HBuGDDax7X/4TMZ6QuDuO+JxaJ/Uk+NvOCjWs5ADbfUUv04cR7xj4J9NBPd9frraU
	g3++cw7fVgdEiTusAq0KKfNgPH68FrI4dPy0bpr2g7l718MUi9piKkWTEeU4GzcR27S+3V60uVr
	xLTDrepyfX4yGQGVRwz/AKgR17aFgDSnR/PbgYOcPTJbVGYAg2hFn0IwRYfB2c4OqKCsjWBVliq
	X55xkFaBLnJykn0FLXzbTus9dZB5K+M/eIp6+cNeEAMjgXU/Sz16VI0IwH7icPGBQSxJrIO3eu/
	dvSeNtknMW1lmVYmgWiHRBDybpYmxwqXyRZHiWYLOfbnHwaybjk4nO43ftsQeHwkaxBTiwmzpfj
	LkehhGqyHQqxexkwrMIMv/+rAcSFng9m6ZdElA==
X-Received: by 2002:a5d:5308:0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4abb36786femr1837057f8f.32.1795135501619;
        Thu, 19 Nov 2026 16:45:01 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:01 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Fri, 20 Nov 2026 01:44:39 +0100
Message-ID: <20261120004442.1687225-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260719-furious-wine-tuna-f4acb8@quoll>
References: <20260719-furious-wine-tuna-f4acb8@quoll>
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

On Sun, Jul 19, 2026 at 10:33:15AM +0200, Krzysztof Kozlowski wrote:
> This paragraph does not look useful in commit log. This is part of
> changelog rather.

Moved to the changelog in v4.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. I did not carry it to v4 because the binding changed:
reset-gpios and interrupts take one entry per reg entry, ti,asi-port
is new, ti,imon-slot-nos/ti,vmon-slot-nos are gone (the register they
were written to only holds the I-sense scale) and firmware-name is
required for two chips.

Gianluca
