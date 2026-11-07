Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053579;
	b=EKsa0asrHqhJRue3/Cl9pmdBJ3LMXvMOgcNmm1lIWiURnYQEQM4PqJmV6jPgAw0u4mBi
	 X/K4/iB9X6uw56+WJ839kpN4vJ5D9ApmtyKVE+IkQi58IGheev2/wc36fjtBDjXNbtGdZ
	 71kTjxazCco74aiaO+PDca6STU5f6lmCsLyOdWBHJJILv58ll3FxqXkSCNwRVW6cnAp4K
	 Wkfg5LIRALWjv8blIdqjrDnAeDWtEPihCf5Ki5N5HXmai9LAeCTHZE8AibqNGFcN2vzQn
	 wTQy/+aCtatkiBUo7Sq8nCB6vdCiSmgzkvm/xAMVklxzfBaWUznBsQc08ElOE+U2p9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8AKXFeIePEMVcJ8WcbZFsZCRz/PozvJrUX2BHGSj9aQ=;
	b=U2OuMDPozuC8gM8FLvJqb/8Oin5QByqaG+GiRM5peMoBnmeGDgj1KP5w/oE1I6gqbXbr
	 iuhOP8GeXyiIU8xnvW2F2WCGJyazZGTgn9//JdyZZgoYh8ooPQPAddLvNMhHTA+2tNdoy
	 ThraVBVw5bAgXoIRc0Q9lnYPxpv8KSomNcXbvcZaQRvBNZArstmBQcSKC969XnkUpjyso
	 AHb7toHikvwWcL/q88kefPTzjon9bEWN0/vHlPbjE4FVo9ZScC8MP0ttHUYNBKIFDLGID
	 rEWRwuSncQszDK885y8/hvwSO6ExdzFptjwVVOhGn6BxgEbwKVqfqyU8VDT+RpB++7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0s9pvl0;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E84606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 12:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E84606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0s9pvl0
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so3003443eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 04:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053578; x=1794658378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AKXFeIePEMVcJ8WcbZFsZCRz/PozvJrUX2BHGSj9aQ=;
        b=U0s9pvl0vgg/uCdJfx8ktblDNhNECzkqCf421S6RCOyXCMkCLYCEL4IRXyQZXQ4ZGQ
         ZT5mNpNLPEwHkBUxKDtcI5vV8HpbNqnvSfwb1OE0uNKjQdXn5Sg+3G/RMTJFfwQTw0jK
         1DMnZrHMq7xHlxYysWGWph+xQx23R8l6aqxft3CRcrUzybgtz6oPMThxK5qTF2A5GCZx
         4IfhbR0/+y/IMcvkIblfzHwYTj6E9ODtgfjfussfaN9MTY/t+HuzQBrWyLL4DC1kIuV6
         WCprWkzMU7i9szSCH6nIraAg6uTOrJZKjR1L8/ttlagsJysHuWGASvV5Qzh3s9Av24+o
         MMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053578; x=1794658378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AKXFeIePEMVcJ8WcbZFsZCRz/PozvJrUX2BHGSj9aQ=;
        b=MdgX0pP9vOgc76rN3bF3Rc3nsTgvCZX+Q1ksNQAh3v/cEeOePjhKTN5LX5gJckf6tM
         E4ceakDU69TZYnj6G1C130SXnPX1JOzKiGPVlruX141jr9tBsB13kIyoyV7tkZq1QcoW
         695mRclhRoTTgtegB8R0EfwBfPn7UR1J1RUcri/u6JAXujV41wnmpRRFE6LU3L5ZrFn5
         kdmpfkoFTVtCI/XOkeiH3Tyf01TOS2jqM+yI0Trcnfwa70hSNJiRdS1+T+2aWm4k7H30
         LDuURao+vyWQYNxl/c4nSHGyGrtVWkARrcdiitgUte4NJ4NkImpRt9rCRcx/9gOEo62x
         QMcg==
X-Forwarded-Encrypted: i=1; AL+hErFoLdYFS1jU2LcjriMstg5M9mQinrcmhzQEacBnQZX1WYnZxOgiKFL1XNFbbJRTIwOhTf7Jq01/St6itg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HO2uQwNy+jJGJpaVL+ERgfuM6noAJHALz0Urr7p2GV3ZGetg8
	LN9R4adrGsrQKP2gfdH8AgMT9AHYvPRadM0OlyHAIEFVJctV0yhwm57c
X-Gm-Gg: AYBFou00sbTFH3faYkrX/T+Nzu+nAAH4+X7uxxGs4xJcJeG+0DO+hyjE6aAZlNd9xax
	rCa6TsAHNPT9huCUxRUPiMundmY42BD8wjNKRtyTcsIXxb3+9kNW+8G+HfuwihaeQgXiFDsbquR
	sqxbXHGVUkVOkt7KmU1KLvhy6VxEGoGbI8HBboci86frjW6ylWFjQgH17LpOzLPQvR55I3zWF3t
	PRVBgB7WX2gnc6E1q8th2W5EA7erDbeVZbCeZg2ntjFJ0HjC10iNla27yq4xY+42uqzuxFUTK6c
	vvQOXVnnA4srIzMO7GBuDOI8fk06n+Zinxvt/sdOD3DGc939P0EYu2BUYViM9HiRFcROlRyaoEw
	fk8BmLk4SxQ+KKml79NdoztaTP6MYbzyYiktwJNpKImHGB7/E0c1wJg2fdsHGKL0ita2tl2LN0C
	UTn4QJNWDAtlriEcEo5BdIHd6DPZ6LF/eMDZaPQUEOehxXLdF8WSkZHW8MYelT9FNO7SBqwTdIN
	6rYpKxt58vi+PCjJ4Iv9v6u9+ZngUA6ExLoeHHtdHMxbqaAEVIc00I8WvkVbzdSbqsos73UT3K9
	C5CxNspuRN2gw+tU2rP7JOrNQFdPXPpx6dyNJzoRuh2m+t5cSOqJ
X-Received: by 2002:a05:7301:4701:b0:369:f0de:259f with SMTP id 5a478bee46e88-36f76c170e7mr6611322eec.35.1794053577701;
        Sat, 07 Nov 2026 04:12:57 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fce02csm16721778eec.22.2026.11.07.04.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:12:57 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Sat,  7 Nov 2026 12:12:35 +0000
Message-ID: <20261107121235.3521-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87eccxyplk.wl-tiwai@suse.de>
References: <87eccxyplk.wl-tiwai@suse.de>
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

Hi Takashi,

I would like to kindly follow up on my first patch.

Could you please let me know if you have had a chance to review it?

For reference, here is the patch link:
https://lore.kernel.org/all/20261106162357.3616-1-sreekuttan2156239@gmail.com/

I would appreciate your feedback whenever you have time.

Thank you for your time and consideration.

Best regards,
Sreeraj
