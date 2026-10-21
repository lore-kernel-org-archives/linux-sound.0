Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575122;
	b=g7YpgjB9wBYvt4v35IoNfF19XjfSQ6jD/nDvusPVg9m+4nV52VxyGh6PRIr6h39Yld+h
	 Tp+ouwLAqGkJLD0eakcvvLVG813UkyTGQ7D0b/GRBCdfLnYqX+x8XSjMehpJa4y9mGEbY
	 aex6pCAWdbFQPG5+5B2rUxXqzk4eiGKhS4w8xVBB2at5blOpIowuNeA8WmfkrNDDCdgwU
	 Xjw97wlbaHuxaIvJkELWuaA0ewfZkCp3b5Nb+cQh/C/RBXdQBpq7WvmVvSH4BHgcfR7Le
	 v2e+h7+AjOfQNOh7MGqF4V0CDAlcICSa/WDIDnTbKut9MdW19GWdQuZcxb98fmqxaLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
	b=Cq+6DdYRUCLx4KhisZFDblA7iL8oJSsW0hxbqCmbDP9rWfVnAIQPgpe154sapm0m+8aU
	 MJZqh6UIY52yw2KvJGXeenxBY1OAZ9nRb3Bm5i6cxCy/qJsAGDQ0lV+i57G3Jn6yki5lD
	 NYDiKPsJ62ruAsKrQGWMuwwUKgyJtoF2VJqSVD1vndsRc+A0SgWJ21NBnVcHlwiDBl/Iv
	 7li5k99LFhU5NIpgCdY9hO5d64lcAezoDZK0JCnmu7CWD1j9/wYIIXdqDqvSwXQTge3wO
	 TET24jWSZHmc1B4/wRKoY1zhMKotvdU3gAG5s5pVOTPDxePmMTxIs/6TJDk4WOFZMPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aq8IHgKx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18F606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C18F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aq8IHgKx
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso708823a12.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 02:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575121; cv=none;
        d=google.com; s=arc-20260327;
        b=GqwuasvLmoZ0/R7Hlh+uGTIA57yRQFPrr5ys2kLrE01zKQCHXS9z5UeUgR777/zpaq
         FsmLR4cRZExnXIQmAfNWwpLfFwyuodtbMFlC1rrf+uP5vdvsf2a4I3VrOhlvw49pct2O
         +c7sqyzKliByo//4EfrRr5hPknTjRjHeSIs2z+ZP/r/nGdoYKWq8e6oKke5iDhmvwd9m
         11FN/ebOc0jIQioWZi92vzmcunFVs3/4Oodccm/3MWTgpyQJPuZcBNAxVM5L5RW/qGxi
         He4MGzibjmKmA/DTXDdj1AxuWwawHDk3CGbJiCHfQCs3519R/sLsrb6Pu6NdnvViHodX
         miIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
        fh=TNnt074OwkELsKiyvu0K7vzi/gDya88ldkdwQmg0lm8=;
        b=c5T/8KAK95YMgbHNTN9InPYcgLa9aWRt1BUUKC6no/gU2apPzMMbScArwypu0MFoJs
         MPfcQupnxwjGh729j2vuNjZP9EwsonwSDWW/kcbMBYC2TMWafySVGGVTHO3eTECGxyBy
         WEh6YC8AmsMIx1mbsC6YKawlo1F0gkhCVemy6JSsQFMpiig2Zey56ukocBCn6CyjKdrP
         ehJQZXdLlRZnSnJFq+zJsIhSMcwZioP9yKJksAFNh9T7qywpexo4XbrMcXLt5pmfA+HI
         WxPHunA4Jvd8RMXUMSYbKK0piNRoMOBJcz0ruSxDK7Q5lajNGTMFmiT4sGoaSFiuB0XK
         TSYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575121; x=1793179921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
        b=aq8IHgKxGRR6sb/GSBo3BOdbUepLmLuwpdhhHG1Wi7UdBhXdVV+91Bnup5O2M3oF07
         o8RmkdCow85hLbijjaaLy/WPQeDtdA0SDiGlTaQE8RQPpoxEFH/S7QhF6hWcqzJogczJ
         KOt7zXle2sv0vQ2RTYj40VQ2eSi1EWQF9UK7h3nEFkNQyDtCFXS/SV7xFHk05MN+r8pz
         NQbiTG2amhrnuSvLw7JHbXPl12/EDNAXJ1GPlaC8gBVLSvNE39vsHnnVVz/5DtfhBRj8
         xi9TGz7ihaH7WCP2XaMacJo7JHoBIeJcCV5xDCJFaHEV2IAp7cGqxGiAd12b1O7XwJFr
         CJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575121; x=1793179921;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PssynWzvfCe/tFsv6jvqIWHAW7HSgyawI/MD4p5fBic=;
        b=UTTR/MavKdQqKKR0wApfMISLmq2GYuprc+XF0AoIpKJu1rZr0IYhvO5U04IbdDluYu
         zAu2mvShvhMaPOY3yvRjKD+077c4eq7T73M82h/z4PHVT0jqf0/spg9XyIYu01h/JqHv
         Av2DghN2Mlr3yBju9CV1St1b5OOd6kBmnwQI0m2mYBBh0z0bJVUpzP3jXoE3B+yX0BP2
         HzP6JkrC6u/PWAH2/C6JHLrUSyE/aAQirx0KoV6ygA++HHUf9IURcWGz5Fm33H70A4LO
         iAGXBWI3uiV6yk+o8wBvP9WMWuVpOMp1RpFKUcdc75SLjCr8x6wkMPIzMSC3RiPjO9mU
         MWXA==
X-Forwarded-Encrypted: i=1; AKwUvBzCfYLkXS8uFT/4YYypW6jZVFHBTbO13NX4BzO887DqzdvLZlaLv/FwJsk6Wt64WIfhI/tMSuwNPL7Ikg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgIErREkyDxMHrdiQdkKD2Mw9zv2Bna9WUHLg0deFHk3idibuT
	RCLmBC73da1DtYK8gqDsWGMNY1eZzpgXArM66/ElemLvxBNeeU1a7RGAQJI6selEgOe4UXr9sWy
	Q9RgZGo38Tf+IaqVFVYI5V1xRqzZteA==
X-Gm-Gg: AYBFou2MEmH6/gJfEpDTSEGdhkdPc3sMuOK2SVX4V9Jwkbzx57fiVjmpoQJnoA1iZgA
	vXdlnqRzxiPz81UR8E2221VcPOhBktVuNBwoSriyiVLdPgwkffcKRDAM/klAjVTE10d/aBwrjaj
	sMVn4oKzAXX1HGQQ0SHa4GujU8vL4FzhYYQh3pQqb0Gyphj5hJVxycF/bYVSRPCTRox3yjcx6y4
	RSiLdDt57Drq4T7smbkW2S9lfDxs1pZoVIhRbq/jxpENmyg82ft/fjWlegIvXpgqad+wE2idKH+
	Xsajh5fxxittfO2jHrRZtoeUGtwnIaqQNpVrG8V/x2EFXa4+dO7i9+LNWeO4PjKfiXZOTVx79hj
	krsbqrvLKWZFTAelud3OcbYKZnUt6qm/XgT0GZXabLgpbB59Oek5NEQU=
X-Received: by 2002:a05:6402:2b88:b0:6b4:2f4:fc42 with SMTP id
 4fb4d7f45d1cf-6b408ea46d1mr825125a12.10.1792575120407; Wed, 21 Oct 2026
 02:32:00 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Wed, 21 Oct 2026 11:31:48 +0200
X-Gm-Features: AclHuK8pA9Yi9UIZGPbxVnTdYw78dkrf6R3soXchP7LX6uklxroFxJZ7GMlfwpI
Message-ID: <CANBuOYrCHc=HSe2z45EKXjfHqPO2Dzh7L7Atwrzboz9d-H=Lmw@mail.gmail.com>
Subject: ASoC: Exploring Rust support for codec drivers
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Liam,

I've been considering working on Rust support for ASoC, starting with
a small codec driver as a proof of concept.

I've previously contributed a few patches to ASoC and have been
interested in exploring Rust-for-Linux in this area. I raised the
subject with the Rust maintainers earlier this year, and they
recommended discussing it with the subsystem maintainers before
getting too far into the implementation.

I haven't found any ongoing work on Rust abstractions for ASoC
component or DAI drivers, but I may have missed something.

My initial idea would be to investigate the minimal abstractions
needed for a Rust codec driver to integrate with the existing ASoC
core, starting with component/DAI registration and callbacks, and
expanding only where needed.

Would you be open to this kind of work in ASoC? And is there a
particular approach or existing effort you'd recommend looking at
before starting?

I'd appreciate any thoughts.

Thanks,
Jihed
