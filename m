Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793592432;
	b=fdtINxANVO2k7Dn+h7uJptdxZlYyzHdGR+dENmL5ctBsyH8UXbv3r0LBLIuCul/i9JzZ
	 56IEDAjyziFtIMIRnz0RbcjT+oxj9vCw/x9aqtJc0G0ljhJN37PCOyFUz7c59OLNSjr4C
	 +XItB7ldoIZD+OyUlDzfWH8stC8uplkqCi/jBc8Z7cTAD95klINQgb2bo6lUL0EWaZyXw
	 oSue6YBmlHyvZlkT7VP8RnrhtvL56Js0YqlrMHpDzL87OL83PN30sd7Tu2TYOjT1zOAai
	 7t64wtPJevg75MOkSJROh/xibyTRzvm9mndnyHIk5BpxpDnKq0ewOvqi03Uya0ccXUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
	b=QuzrldOIagBO+fzvWRyCr7DrR0KGCfPTPFne3UNwORLApQRKy5EqrlkvOy1dNdbp3hob
	 S1SZ+oa+4CC0JC2dF5EFxCLLn8FY/pcZt9+GESsNJdQYS94/ktIy6iCsJchQ0RC4vLtMi
	 pkYNBqC+lqF4C3xPPuZJ8nkLDW98/dxepdmo6Hr1OOf/5Hf7GO7R63sU2o2LYu53Ho5I9
	 H5SoSV4l0s+bErBl7VTz3yS1v66WXyP3+5Q4JCgKSB5UP/u2p7UIAyvCvi1l47Sl+9scQ
	 Z8s9pDsGaCu4NxfyIYHtwLJ9QalCT8z2kQK6zg8lelt/1TCbZLVqqWhqodHqGHXZgSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/PQaWUL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F9606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 04:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/PQaWUL
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso1672744b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 20:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793592431; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1STQmoOo2qVE0lce1H9BxeyxNTjzPPhq6Ko5pak42OcCWbjVnhVCpNL09y3GvmexC
         3C0s3ORCjdMde5+KW2OiMgArHBwt+sMi1RFq3KQKQ5NWqDlBiEWk0i+xFipAH1zhTXLR
         yVeKB7pWLpJaUSX53VZ3FIw0jew5jPBKyAICp2Nt6wcJeoCf1FxjecZ8WmEERn40YO4v
         WvcEH3rbCcdFHyhIp2J8clioLSKvUxMgk4MdnH+HNFW1YaGuqSdGWOhuy561dz4gk7gz
         S4Qy2/NbSWTu5Pzo0NDj0vD6iCY+5vOINu+ZCVkJkPPvvM4uL7uvebwhRKU7CtOHaM1f
         WEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        fh=O8N5sU7UiZzZ6o6Go3IdQZLwQ35RYMqUoR4/p8+GJNA=;
        b=Qap8apr9uMYN9e6Z0kWiMfsMMg+3Dmk4mhaMi9saGqq+/G4aod4XSlyWAfLgnf9Wul
         jLDXaSqsOsNAJsYVK4V3e5HNH/dtVgrZ6uETtG2Vv+mC/P4bP5YeLjAA6ac3PtZP+JR9
         ilhbruI6rINB/KgLvSFXTa+Zs1CwbkelHUNPNfxzYXySpmiMA1ts64NcVDxIMuX1AIxP
         Qoe8r+EHiSNvp7uW7/J1R0HE0WDzjtXq2QNUt/LXy5binj9VZIZXe9Zc4ZUfTI2cD8Ur
         j9kW5oH86T2+diuL4y8yTb2J9esXh6gQoix30ctmUdl+RtrG0FmZB4KN6n40+X3GbcUX
         Xl/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592431; x=1794197231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        b=n/PQaWULTTcvCt4vkoQZcj7h/RsyFJGemB/065ZoKLOp1IHgZSSH8tHEqmfJMdAaCS
         /Os3PUXS3WDwSIcpHGhDi+hCJykQZXiEZE1ZJ4+rjJwzWDWmawvAhywNpf/TcBl4wJeY
         VFzMDLNM7whSos20IKuaNcNS0E4pV48GzqbbBXwrpEtT0dunvxPVXymyWl0sGMMU/2PM
         FU6gIEz6zJWC3VDq/N1DwNfWa+dfsg+i2GolIS8JwO9L/gh2chtTNpA7LKs/oZzRMXc1
         8koHBh48/e/u5J0Ye0zWEF+vVBdGmiHlg1lG0jaf1Yy9qX6To/tgidTuJsYbaKfrZ9i9
         Qhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592431; x=1794197231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        b=TltFKnLJj1btGnR7jj5C4FnAQux2wa43U0PmHbN+7dg0+oiJrDzgsHhkA37MAl5Ed3
         De+Eb7CNXoErC11SrlRWJrHtGXDhlpefwD0O3GIuszSrmvsa+iM87ygS4Ajqlaqn33M1
         elIvxCNrDe161xEfhYgs2VsOZOI1NmNnVcZ07/gEE+zcluDabHnKw0jyMdI1Dh4Wpl4a
         3n6CWPhHJMGUnNDze7bLSYvoBZ+kK6QQ0kHorENXFr1ClnYqdfXeiEEU3jNEPosyrCuA
         m091oAcG6nOeVovym9osUZKlBrS6f0dk7c/bF+br7M/MzKv37P2F/4GNdLIqQ3CpneBY
         1FAA==
X-Forwarded-Encrypted: i=1; AKwUvBxuyEDJcQ8VBCz02rZlntFgeQZlpadJTqS+Je38oOxi4qtSXEriQrPEfWcmBgQ2dL5dOOfWkLrL/XJyaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6pnl4DJb4iybs/OB72+LsTcVskc+qAPzBX9hDhCDP4vtJS4Oy
	/4pprxyslWbis5DnJER3l01iAmen95Vq37vIN8yYO2Gkw65uaNIb4/2xVXInOMYvosREwibUrFU
	nmnGHbN5MGuE/d89U2rDs8W8ElxL42jKz43iK
X-Gm-Gg: AYBFou35Auo1NX5WicMrz9rPoCuhAjSKx75IBQ6ufCyT2GfYKqZzoJaLnp3C5eoFc+U
	tMhDca5Pd9xemMMeed/OjFr0RiaNAFh1MJM+IYpeIxyLIGSCaYu28dU73bUD+hGrHDTwrV9GqpQ
	pWBCZh1d4vLJWLZmaDUaQasHFx234aENIqkDNnjd4tjyBYgAen0pOF1I8pEgzQlwDsi6p+tb2Cs
	nrAjGOHn/X8turKsycgb7NM1iow1lgVKRqURgUuWQ4OQIUpxTAqHzo/crUfRlL++aP7yUWKs2Tg
	yZXXxzqJJL5nhclqD12ceKzZ8BBRoRvImib4FkmuSZur+58hXRAd8jtgRGfULnVfReMwcVSg+C4
	KM8P0TaAadbHebgYbM4Ei3Cq426EOvBmbrXsHPNFeANQHkNxAWke0Nz4YGkB+hUqXFojfk9i0nh
	UW3Kl21fdmDCin0Js8YFkqSAUEhJKnumIzvxmmG9pySNHrGpOH
X-Received: by 2002:a05:6a21:9cc5:b0:3e3:37ff:378d with SMTP id
 adf61e73a8af0-3e9289d48b6mr7780763637.40.1793592430971; Sun, 01 Nov 2026
 20:07:10 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179301363708.752130.11323881261715222213@pm.me>
In-Reply-To: <179301363708.752130.11323881261715222213@pm.me>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 2 Nov 2026 11:06:59 +0700
X-Gm-Features: AclHuK-Gw2LzF3mHyz4xOxxQKV5R0e0KWfeLN-nORpS70vKs3u59r3GyDfpcj_w
Message-ID: <CAABR9nF+HekdvUboATGc71JJcA-DgYdzQVBzqb_-wx3QbvbhjQ@mail.gmail.com>
Subject: Re: [REGRESSION] ASoC: rt721-sdca: runtime resume fails with -ENODATA
 since v7.3, jack PCMs cannot be opened
To: Robin Everaars <robineveraars@pm.me>
Cc: Egor Poderiagin <egor@crazyrussian.pro>, Oder Chiou <oder_chiou@realtek.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthew Schwartz <matthew.schwartz@linux.dev>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

>> 7a0886826308 ("ASoC: codecs:
>> rt721-sdca-sdw: Propagate regcache_sync() errors"), later simplified by
>> 2df329044c61, makes the resume return that error.

Thanks Egor for the detailed report, and Robin for confirming it.

I wrote 2df329044c61. Besides simplifying the error path, it dropped
the regcache_mark_dirty() calls there. The commit message calls them
redundant, but they also set no_sync_defaults, so with them a retry
would skip entries still at their defaults. Without them, every retry
writes the whole cache back again, defaults included, and fails on
PDE23 again. I still think dropping them is right: after a failed sync we can't
assume the hardware is at its defaults, so writing everything back is
the safe choice.

Adding regcache_mark_dirty() back might make retries pass, but only
because the rejected registers still have their default values. I
have only looked at the code, not tested it. The first resume would
still fail, so I don't think it fixes the cause.

I think the real problem is that the sync writes registers the codec
does not accept. This was already happening before 7a0886826308, the
error was just ignored. regcache_reg_needs_sync() does not sync
registers that are not writable, but rt721 has no writeable_reg, so
regmap treats all registers as writable.

Maybe rt721 should have a writeable_reg callback. But I don't have
the datasheet, so I don't know which registers should be left out.
In Egor's traces PDE23 REQ_POWER_STATE is rejected. Can Realtek tell
us which registers can be written on rt721?

Egor's patch looks like a good minimal fix to me in the meantime.

Best regards,
Phuc
