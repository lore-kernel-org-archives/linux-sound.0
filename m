Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138862;
	b=l3incIGCwSiu2worI5l/WLufSCPmx3Cua65GRJ8CVs7P4COvC1jl4KcDNroi6Evzau8n
	 b5d4fZVTsPLL/vbO/6mhvsGxij7X1c6T6JFJ20myotWakenKNexpj5O+kMuj5NQFgqS1f
	 rSTAyNymsJWnq5zNM5x9Ujgkhu3XzjpvMKDdP3JZsD0JgJgH6/qTfw9cK227qsEjYF1G6
	 Kv4yZ3noqPRmPrdX65fO3l4YXTnNDOVX4gDjErKEYRsVsq8hfxVli3mHWpX7J0tUVmYNy
	 0jnaG0EesnechKkZNfworu72tNpZCwBklgQKNNpwf7UNvXki8G8shJ8FVmvX2mDMcig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+hSDoeCHV95MTcU0exwJ09QYlst4DO6dsxKv2LnugqM=;
	b=gjWd5GwA+E4U8ms0xhrGoMo/hu/maOiRmldnaktcrWBgXBmjYoIK4w5Do8RJwCijlGH1
	 hgytreyr0ez9apKMJZjdNR9CwlQ26FG2vjblDaEqaNz9mysXMWInTSHVNVyChKFnVVird
	 q7oRtiz6dz5MTrsEXBS4ud2/iMre0ddREptqicDf8Xgf6VdoNNwK3L4g81oIfmAx2ByW2
	 1cucP3kftlmCbDs1btdHHaiKOnWL8e5BT7k+eo+oPLzt+H4I8iIk8Rxfi12Ac6RLL88+k
	 tJQ7lNjBIQsfRURRV6kQMixr09rEn7v9m39epsADIUnU/GhoQCD7p28mYKR78ensN8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoHgcRgQ;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F0606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E0F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoHgcRgQ
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso81100eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 03:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794138861; x=1794743661; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hSDoeCHV95MTcU0exwJ09QYlst4DO6dsxKv2LnugqM=;
        b=JoHgcRgQpO4mryH5LvbiD1VQN5AbJycvWNP7w5k5/l8/3Zf3lyKstieOp2M2+BcANc
         RYxfXH977egJuwbFIB49WvOGV/YX8MMTw1wbFFf/iGfKCdKvunfbC2FSlTot4ZqF1DX1
         oFnRRt/Loezl1hjAZtl2MhRYXtZfj42MPtZedSnZSzzrp3G8XpFwaw9JsyqXqTz+mAXZ
         QJxgET/pE3W/nsn9snm1CoRmafeQid0r+YjrAJUAPQHmQbC+0fsgM47/zG4nenU8aVRU
         TCLf59Pl+8g0AL21BO0wbGlhcFljFhwJ6+Tetj035tKC+sGno1bgSkq/U8tKT20ggNxG
         QBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138861; x=1794743661;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hSDoeCHV95MTcU0exwJ09QYlst4DO6dsxKv2LnugqM=;
        b=LILlyHD3feLOzQwTeLV6i3sZY7bzYF8LwP7HbhSpOpfFaA35oEaUT4k8wQgPKXwCw0
         M0IhPU5LKMnVHIqAwL8+wi3dFY4aNk1/Z+Juus9J/4zb6O3udbHlSBi3NPpq62NL6AKY
         JNCE8CIYZETSM3wKKjsIkrr0ZXilC9VXlyzhkGbjcoQN/HNPoxylHD8sFvQqJ/b5ljRr
         Da3NvZEjIhFPug/eojBECJ4izYCOjuk8Z1FdhYnmPwa8y6O9r9gFpLcsgGWiom3R89Ut
         r3N/m6Lij9Ef+ERlRJFnOAnz/GiinqEVLYjFYGt8f9juMooItiPzq8L/KTIIcFZxFsL/
         /P4Q==
X-Forwarded-Encrypted: i=1; AL+hErHYABNHFA+bh5kXQnuzp3cFTtDozsKfhSLDH2ekk7ULQbd1380nIJ5xPl67l19fNP7SKfy8PhAhJKVtLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ykGpoFhgCAaxhJjg0upOnUQV/ySsVsD6vxSIzK8SCxeZAT07K
	W9iXzGU9dieAP1iTnjse0HbsqaZ4nxnh8YuoQhptboXFtqB7IohaTHCZP3gLwPjaj/k=
X-Gm-Gg: AYBFou1O8+iZSNAISDPn5nM9xIhYtQ46uhPGZuTx+UJmifpWli0bvcgZX84vpMjrIZK
	+ctvejGzpcOEI5yOsxsrdPFBEPaQQSmQtSszKMEKZCALa8yW1dswuHrzyWDPOKMGFG1fVEaLDeT
	brspEFBkJXAD1ii6VNwyM48Bx1milaUVSkdDEw+jyC3FWxK6HdSSN/cpcmHQvZAh/pcKNswTD7n
	fp8yCa7XQntntTI+sTCGUfFkUVU4EC7wkU50ojuLh2LrQibC+fTYpvrkrMGmHCuZNwJtaqRSwnI
	WekAqH4IwBSyUdtsmppMzwEbCwfyDEKirV+q3ezyizSNidJ9HGzddCnWlURzql50Hk0cGfHqdRN
	1fOdbmel20RuRVAt5xBDHDriQjJwFUDyHlPR7dcqm0To3SXOPRwbRnuEP/BZuTbmwFx3zY4bLVw
	GuNR20XvpNjeJ8h9Bl+1z/6I8HBdSqNDEX9ujL83Bng9KHZ0UKr3jn//2t2C185XMH9MviIndcm
	dLsOEn46stXVH2v/GPLOYRC4RSDyWCwowYQn0jMUbMwKDmGMN9fMs3FTvt3MONr4Vws+KnGOQBX
	S81GTnGUygwZxypZBJ0id0JA33jevFQ=
X-Received: by 2002:a05:7301:c83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-372566144c7mr2538503eec.10.1794138860540;
        Sun, 08 Nov 2026 03:54:20 -0800 (PST)
Received: from [127.0.0.1] ([45.198.20.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm4715288eec.11.2026.11.08.03.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:54:19 -0800 (PST)
Date: Sun, 08 Nov 2026 03:54:19 -0800 (PST)
From: alyandra5b@gmail.com
To: sammiee5311@gmail.com
Cc: tiwai@suse.de, perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Message-ID: <179413877928.27072.4989388975502966406@localhost>
In-Reply-To: <20261108113645.1730429-1-sammiee5311@gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
 <87pkwgyck9.wl-tiwai@suse.de>
 <20261107142950.125901-1-sammiee5311@gmail.com>
 <CAJYQYHxrpmBPiyMiS2oK8eugUMR=KFmf9D5jwLdoYUYQgKkXjw@mail.gmail.com>
 <878q33y4z4.wl-tiwai@suse.de>
 <20261108113645.1730429-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello HyeongJun and Takashi,

Yes, that sounds good to me.

I'm happy with putting my patches first, followed by yours, and moving the te=
sts into a separate selftest patch.

Thanks for offering to adapt the sequencer test and incorporate my test cases=
. I think this would be a cleaner approach.

Best regards,
Alyandra
