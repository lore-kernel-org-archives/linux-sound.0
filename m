Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984438;
	b=lB/iL3R8hFBUTWiKT9df4FomOoaAhc+pptJgaD+MtWCcaI34PMOr1JpyBJ/aIdiHo+eh
	 TxyZ4SeGD9oZXL6ojczxRMD6gGO9C8CyZi1IBRZ1O66L/PNR7jdy845I1zwtGi+tdRqo9
	 KaI3jzcqzxdykPD2iUHjj7btAocIvST8iQf24oEn5m8Q7ABAy3dQFkX2uLrahAkUR0wNQ
	 wqt34+DzKtBCSiTpiVKADi778Pu+IX7BhvXn6LTIwRiOWx3VQi5IPXQVJuGqMyKVuDDUH
	 ZLT/FwRr+/J3vIrn4vZt/srS/TLR07v+7XxpeNQufPwXvXvxOwfITA45Kkljyv3hQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b81eMxBo56MOfmTfLGHMaZaGDdibI85t7kUY1tZMOyo=;
	b=ySIie2VRPLqabQLyM274zFnrDhPV55wXAwc8dgqkBxTF5pmxnb7PDOVuRzTLL7Zp9z+s
	 ZrScLtHL3a45gFLlPSRD1GYvGRZtH8wjKotwPbUYnzxP9kXtJuhnGSgCGaJEwha4Tx8OT
	 JUb+CrL6j5H974mY7LFT3faygbtO6IzBg+UXKVh9x2aKTs4vGr/7iSLwf1P5+9Vz1evAr
	 CayX8NtbRfnj3hVVDwtSiHwUMHmNQx391e7oc2hbUoTUX1yVvNQq05vy/h+pbrhXGbdWG
	 VoJAMUlv9bihBv4GhLby7nV45mVR/vSK41nRUWJZxUk33jP3KyOYLaeyRcLJzBwekYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WHMyyMnv;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCE606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDCE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WHMyyMnv
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4306893eec.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 20:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984437; x=1793589237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b81eMxBo56MOfmTfLGHMaZaGDdibI85t7kUY1tZMOyo=;
        b=WHMyyMnvINzjBq2Ix7uZugPg05trMWCf6Bv+65WPI18tuLXRrLIebuzLYFRMslCrnR
         d7Lek6iIK3PEv39wQX2t2gs27Vzb7AXZDohESdGx/+u+CyiUCgrZ8FVKf5JnYi9el8aG
         A9PWwmbE9aVehA1ok995LROgnCCd4iz2fnAmTVThCzSxJfPzj/qpQGFllBd5JGblZmq+
         DNoAqtLDS+1KC7kAoWOh7jQJDxG5XjLT+bFQtGpArxX1fCKsKcWTDOxqb2+MohZBKCcu
         1J3hp0h6MjGs0CxG2f/dyo0vgh/tJTBjxT6zmhxbogHdCbHkB8j4SnD7P0JbQsMAkMxf
         z3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984437; x=1793589237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b81eMxBo56MOfmTfLGHMaZaGDdibI85t7kUY1tZMOyo=;
        b=n4oYrxt95e5lw8ZlMeuWJIl8rfzltESwLBKZBBv/QA7DY45uXo3JwYvcmXPJKW9FqE
         w/JlLyXCOW0IRMcnv6Rp1NolIABWkt8gYad2Ux25hPgpZdEdFAlfihacIjQbyaYK/XDG
         jncxl7W1zNT+Wn3qz4IV320OE5lsEjuzoKbQm2jN0qImX6dlgzA9zeXdddv09TtuGwBZ
         PWso2YF+EoNpWWwKbSX5PyeOhjRTk5aUn8ZCrZ3AjxdDiQAJRuIpmhhzxdNFik67R42g
         RW97abokX1wS5QH9tc2L2VTlGyhnjLmIKd+ojY1X+7Bt/hdTTnb8WfiXcnspmkBY/0wA
         rtWw==
X-Forwarded-Encrypted: i=1; AKwUvByzRFkiZU2tYP060Tu5NRy9E41HS4Ag32uwccQbXIt25/pFPhIsiqpRfxDiYQWzsTXQu8SFN3ZbBZbmWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ2t+e2OdbdrAy0bv44H0Ea5iWkGmaZG7U336NHqG+rO59tVUf
	eTAr8Vh9LA+JFuCN4h5I1tEoZVCRPWP6bUbXvFKuTVlcImtjjLFF2AJX
X-Gm-Gg: AYBFou0WWqFZbuIgoABCMvQyuVGSsLGiJ/I8xMQE+bNtHEqOhBPFft3Fh+nCmC8YQq7
	RwLcIAuBFlcHGIhZbLoHjTBbfvDostU80g/omkMPV+jwn0J4ruMLfXW7nu1J23laiUZ2MgsFzdE
	pmH/h7ndEL1/Z2cOqrkhgwSCFifF+URxhrdieNtg7meOa9LURK8zzE9gbMSiZRvM0i3aVJ/huA0
	n0eOTkhMUN84pb72NQQIbzmnrb49m7+EKrCgn20ni/Q66+Jc9Vetmvx+M3iF9+VGkLoE+2v1Ugc
	QIJAGtDrePX45aUjaDfx1hiYQk9l9UQ15T1Z1MryKMt+vSqSeL/XgncGppoJiJV00Ig2OgSJUL4
	1jNBKLbB3uvjoYoh1fdaGM4T+r3LwOXpy8j52OWHApzw7JTtlh9hfKep+10B95f/RWfkwOIdVln
	l8zsFz8mlYj/YDkTvj+dPj7MEoD0KMFOl+3PCKjWkXYKeNLHTyFmEgg5U9/SezZQK8SYaXsSxHt
	J+keDmyZZjoDDW9Umy3MQpsZXhF9eXC9KPG2a8Jb5sHOVVQdqKg8eBkkYXdVPh3Acau1M1XKCY4
	Pj/X3RKsURJIYblqOYvhm8V8wroDndSzUt7kMa3rklxY7ndLjOevo5pqCZLHcqFdUkw=
X-Received: by 2002:a05:693c:2a0b:b0:35d:e9b1:1c6f with SMTP id 5a478bee46e88-369e820d99dmr7427175eec.0.1792984436614;
        Sun, 25 Oct 2026 20:13:56 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm25937608eec.16.2026.10.25.20.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:13:56 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: zhangyi@everest-semi.com
Cc: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
Date: Mon, 26 Oct 2026 12:13:49 +0900
Message-ID: <20261026031349.2698504-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023020906.28958-2-zhangyi@everest-semi.com>
References: <20261023020906.28958-2-zhangyi@everest-semi.com>
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

Hello Zhang Yi,

On Fri, Oct 23, 2026 at 10:09:05AM +0800, Zhang Yi wrote:
> The register related to "ALC Capture Recovery Level" is ES8326_ALC_RECOVERY,
> not ES8326_ALC_LEVEL.

Thanks for the fix. The Recovery Level now uses bits [2:0] of register
0x32, as you described, and no longer writes the Target Level bits in
register 0x33.

This could also have a Fixes tag:

Fixes: 5c439937775d ("ASoC: codecs: add support for ES8326")

Reviewed-by: HyeongJun An <sammiee5311@gmail.com>

Best regards,
HyeongJun
