Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794543153;
	b=TonWAlEL0WgR6q7rxle3gFyz+VaI6FlB0VTkTK/OKB5JZz6ObVioerHzGVvLDiaJRIa0
	 XapVGNwEcqXKJ002wJ6dz47OUTFPvohGssTLXvx3nsYFNSw7l4cRoSwymZPAJllldN2qb
	 Kr7tZjH+Ao3EJtW6bdesjrPzMRL4p6E0Ngx7IsVEDZPdWxmUF+/dm4eQ4B4RlJ13RYC7g
	 BzHFBOaGAMMPK9oiQmAoimzTq/aXx5yYB3a6L2weem1ok4p2Z7bI2020YS4jArbrjeo7Y
	 Be+7hfe0mSgZoE634L9Vb2P9Z4vVDVwemesnmdfLebn5x1G+Ae67eIj406XdV1AfLIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
	b=2Zop5nwuLa/6PoJMt69ktVhxEvwTxJcY3cTwgirhNvzdAl+avz/5xMYlSKOR2niWHNzo
	 6Annt9v2CNJPv7XA+Jya8MwrX3oDja7PjBvnyrSDLi2V6oj+ZuGftWgT0BInWwXTK4RxA
	 ZACfSjrZbDG8cMFKrEit0Q0rtFtWoE/1VlnOZYwxUATMBPxOsQBzhwfCfMVV5n/J53NAk
	 4Igj5q1sHZ/XTU7jr8ow30AVdNiO+vhgVV2ypbBojvEYnChyJ2kXhMBA0kyKUACSN1hzb
	 jxQj+PrPNx9gYLnuFFMPIxrgQgKVMqlI8UkYG2si+HKxe7SYL62e0YoN6FoXmwpsboA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrx4nJVz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA03606A321
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 04:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrx4nJVz
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so1611865ad.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 20:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543152; cv=none;
        d=google.com; s=arc-20260327;
        b=C5FSVNGKPcgG1M/rR3u1l+CDscDKp+yUqvVb70x2oI1uxPrrnZIdsAmnOtPIbBrTv7
         Y/mJCeOdiIOblL5fhwfgp2oh/1o7GoZvsl3JBCyaqN/xAaS7DNbI9a+IF+edwxkhSIbf
         9yALhsCsnmUoMQvDRa19g6zzz27ypyjJQAHcUN/lMLd3sculKchsVNvBNvm4hl4LlWt4
         R12Yhbly+3pa1NlhF2wiCnHyjUXmKarOHz9xg4POhOqjTD7XWScWhs0nShS4U4OnKz46
         51Vy6flSyV3nCSnNwhLMyaKDeCAIf+86KHbP4unnqgyZf9Z2kcR4j8S5meJkmfzfuWIm
         ljkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=BWLIfHiHzxjrI7i6Bwd7XPAtoyinCnb1EU4ni9TkmhR9yKv8xm93b/FYyVWHKavL3h
         FvkvHnq4kqn2fdntt76q2mo1HtNlPkPZqcKBkBnpvGGU7dq4Wfz6je3hbSJRhQ6jc+OZ
         p8MvBxPKDB1/QORXvKnQ4wIrwuODaef8YLM2D0rTiTDwlPsgqq3GyU0a+Cu3rzddFnJG
         hH08dDGyl6Ad5rQxEUyNK1pSVyPzKdlhjsbMOwADf4hFarJDNOJ++K47LsmDiu2sB9Gl
         Rns2AfwJGgdui/W1NU2yR4wOXo+x5cRKvrGpSdSrmTdAgLUJ/9IsD2HS8+v+ES64fSDJ
         mN6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543152; x=1795147952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
        b=zrx4nJVzJ2HGYb2L6cVswF/ZMAXuBnbe9rokAt/Yb/R5+5UEdg35BvbqJ9jJsO1BQ0
         nz2hgM+/WFTiPt/50xPn7QeNavkfpcqxtmyc+MncV42COJOcNOopCsOb0ZqtA3hdgiT7
         OqQsFG7nwhFaq0kqh50O0cGFScgqTrIh6K8EMzNLsLJrCXhz3aJuoe13K05UIRIxdGEA
         Pq/lIndZPo4RQizGG/bsNxwXlhDa6pBsem0WbG/CG+/SfoP2sB1LC+aT/iCVD6bZPPg2
         i3RNc+EKfz2itXWtxnrIRDVO6p6QUWZ4PFKXhswbhFsRmsPokd5vGVEgroPJNYt0gDAP
         QRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543152; x=1795147952;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nCgmRaYxEgo+SI8l55N+Zi055vVLjhQIc00v9kfFU80=;
        b=QqbaI5o2BFpEjojuXowWhE+UKFkwL5Mmn8DocNirbELQP37v5oYgJUv4lShEUr6ltY
         iqmHcexfbsB5RvPZDQWliPtUfpPESG3UUaa1XqqI27JXGQe4Ijn8AfY1dweYSahzzXpf
         R58ZIU0hl18d+msBXgoOUb8s436QVz524ZmESZ10hh5w9Y/ELP5WJPL5eo4vDE8BUjk8
         O7/EP+NUa2K8PuFF/UqOtmsInwgALVuj20GBTOz2bmPQHaX2ix/umI/kRyFUV/xlLAYC
         7TauoOWhcCXfjVvwzn6Uvsch1Zi1DVIwJSrYU5egQcEiHL2q48PZXpfl9hCL6mU+iqYZ
         7tJQ==
X-Gm-Message-State: APuU4Z8BKDlAW1Vp0CArbINoIz+zSSnuRPIxfASmb5BS4BmZNXP0uQZt
	7yqKowkNr6BeQCWjfdETegZhITGbrSHOEVBMfHHfrOFBMIT4Oaeu4FjT10dDDgYaixtQXNmTBuM
	plrmpwHWcJS1anUZFSWWKgBhnL2DIsX4GeSri
X-Gm-Gg: AYBFou39ZheysZu+ZLW94Y77a/FD1BdiRcEU1kZIqaKJnwTiGJ3H35lWK/G26gCfsmh
	ffybhNTMG7NgeFDvlQHeZ/rhqDF311dFVTFlImbFJVSiZvEaXPtryBQFUfDF7Yu29mbW9R1IDWT
	qsE2zwu5k3y1zb4CttdMOd7Z/FgayPijPMFlKQUcQUZQCxOhIpxLmXaMP/ORUhlgC/pCwhPwhH1
	2H575dHmLp64a15ZGxF7l873WCXvP106IfWrUyNPub6tx+EL8Jx6s+BFAzjuBQG3v6xfgmQWnYt
	DPwoExwjdDSAHodiKex2Vxr1rgEpE9XIE+XLhw4ESuz9uTB4gqcv+if2O8508W3MLMiBATMTBqr
	V/5ykTDwvG3Q5voeqWiUTx+OEycK4xwfW5Na0uyB+YulUYmmPqBVmAwtJ41104TjKK1Nom9DVBn
	cDgHbltchrttS2wbo5Z9s3b2/n+X67gKctJDkBADnYry/QEX85
X-Received: by 2002:a17:903:1c6:b0:2ed:2e3a:1faf with SMTP id
 d9443c01a7336-2ee0dc772cbmr13160465ad.47.1794543151902; Thu, 12 Nov 2026
 20:12:31 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112105116.32274-1-phucduc.bui@gmail.com> <20261112105116.32274-6-phucduc.bui@gmail.com>
 <sashiko-outbox-210986@kernel.org>
In-Reply-To: <sashiko-outbox-210986@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 11:12:20 +0700
X-Gm-Features: AclHuK-EzYz6_0u6Yz6Hrxu43cxUaT0UCJf819xej1Ox7hyEl1KMsad9G04Ad8A
Message-ID: <CAABR9nHy59D=zQwQbLP6eVT6bsZ3Db8vo2-cKHDCdqkS42TiJQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: fsl_asrc: Use devm for runtime PM cleanup
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> If CONFIG_PM is disabled and fsl_asrc_runtime_resume() fails here, does
> devres unwind end up calling fsl_asrc_runtime_suspend() while the clocks are
> still disabled?
>
> When CONFIG_PM is disabled, pm_runtime_enabled() and
> pm_runtime_status_suspended() both return false.  If
> fsl_asrc_runtime_resume() fails, it cleans up any clocks it enabled and
> returns an error, which now triggers fsl_asrc_runtime_suspend_action().
> fsl_asrc_runtime_suspend() then reads the volatile REG_ASRCFG register over
> MMIO with all ASRC clocks gated (which can cause an external abort or bus
> hang on i.MX) and calls clk_disable_unprepare() on clocks that were never
> enabled.
>
> Registering fsl_asrc_runtime_suspend_action() after the !pm_runtime_enabled()
> block (or using devm_add_action_or_reset() after devm_pm_runtime_enable()
> with the !pm_runtime_enabled() resume handled first) would avoid suspending
> an unresumed device.
>

Good catch, thanks. With CONFIG_PM disabled, a failed
fsl_asrc_runtime_resume() would indeed run the action on a
device that is not powered.

I'd like to keep the action registered before
devm_pm_runtime_enable(), so it still runs after runtime PM is
disabled. In v2 I'll drop it with devm_remove_action() in that
error path instead.
