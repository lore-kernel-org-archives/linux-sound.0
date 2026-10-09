Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466617B418
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529405; cv=pass; b=OHbbPMYM8NVMewS405SCaCqUtohWDZzz5FvChaIw4KOZW6jJlWmvvU5vi8yC9RUQCViEBHM4uxgCEX0ZvnJj6T0JSGieD8bseNgVUXFH/QNDULGSml5m55l5uI1Ci/IU5/7QRxtJVaKbY+wWaQAUEjGwsDZCEJbav+m7mT8njxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529405; c=relaxed/simple;
	bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icPv+/GCjf7AMH54ZWeiYMfVJfBf5ALI/bUAxFFX3DaSKOPz/HWmIyj1Kviv4pcg2m6nPhKXuuFtHvJp1sG1/6ATvXWnywhX4Zi+IWLkyUDvM4PH0cAlU59Pi8RhBRZVefhFeQ35XmJ8UlXU5uzlDESnwRuvR/sYdvN9VlmWa4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vbcw7HNk; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vbcw7HNk"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8874539bccbso3110322b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 00:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529403; cv=none;
        d=google.com; s=arc-20260327;
        b=LlLu07pjSpyGmAq74Glfh3H5eWT4mPvyz0psGWCAfrg/8bt3qkxDKMxdehTgpVCISf
         2P4kcv/EvgGDeEegcml3ubdhr/z+XHpjR1HqWQ99hmwFcgJKrbNSuk6n1a4VZZaMiEn2
         +YRbk4IXhAt3ApS/IcWdYsKAdAhEbeSygejqcufs7a2fncJV6SvLjo5VpA+hgNKn0O/v
         bwZOQwrj4zo+B2ztGdbePkskMTYNInrXST2cDMCA9Onq7Uqis1QqGYWCbE8xRg2ozfYJ
         fk4NElyjOAQqzistTWxETziMcF3mDLodmUHeA3/p64fryxaBSEw+bvZEYdmqbdpyay9Y
         bfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        fh=4SYFkiDJ2EVYTVoLMSSCTzOJQ0OF/BPZeViRDJKdraM=;
        b=BJNn5Br9Ws8gL+CO9UfW46sVr1CpkaHbXfDJawCnSThI8rMe0nTZZksubZClIZtxE8
         Ap/rBo8l0Sg/ANZhJ3IaeHYeBlsxp7tDmoKQlviBKwU0FpPPspdtIcKWicpVHt50YRm8
         hyLNHEzumw8Izz8TsTsAmBk6wO4NJwH1EYzPVwE6hQwvsKFuR9Amhq/wnB+SqhlMAzVp
         +Rs71svRSFKPvBgFZ+bD+G2iK6q2hh2XlYjkzgxSk3rHXPPEUpmbM42aLT7cYLojNvlP
         H4c/TXl6xj4QtYIpNiuxfw6tU3MekInNHGsiyniHvL8N/fpDIh3lEHSgHceeX9txxOZ8
         e+Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529403; x=1792134203; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=Vbcw7HNkUG9V3/2OGa1oAh7N5o2VWD9fCmIsYs/S6pGcEy4OrN6gJF5LwQo6GElKIj
         pTxELvnWC/3GF6CeVwS8S+kgBffAO9pSrve6/4WAYerMBbIISCLeWpzJFrDk5xM3JQz2
         vlPr9MhJRx3BWRhe+DDnuwkpjHfgs3+pqAjDzodMGXtNQYHYQTNhBVupojd9QrA+O8KI
         AtGNqHMQn1WdI9RxWCO1Qycmhy3QgPfe2N/nNaYJPu5nwReu5ZEAH6xQMxaYUJylF/AO
         4fKj3bEJU0hyhQ24HoIsjQcl7uct0w0qEdtHVjzSFA5OVBgucL6v6oBN9n9LWT+DQ8pn
         tcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529403; x=1792134203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=zRUTLRJssgCSc8AcxiW2mGluuIdfX+qltzZNKG8WrOH6FHxnAVfDUC98ixLERB/WDg
         JRX0HGRKu+PQumtE5lH6hPvp4nF+EF851XaXdPTgwXLyapvQ9iukUvOiGDJ629Vah1Wq
         Bp5Lkm4DRx2zeFnNLYZ8yVKrSLk3ahVjnC5gv7onEVH1rL3ic0kV/Y29KciRRfmfX08b
         JUORSPqMuOTpKRU44CSiqCSJ69gc5+wGsi2Gyq56jWFCjwE+nJ68DqBf8OEfYd8QNo7K
         NoSdEBERzVilF7vijWDLsFb0wrasnNH9twbajWegxSkQqaWogr13EIDzj7wRO/ibW+Hl
         a/ng==
X-Forwarded-Encrypted: i=1; AKwUvBxQ+zsWNEyg3NOFrid/Lsp2ISJVykgu3J6hf7VbZTEcZsojWgi8KpZ05+V8rPYeR659UavbeASc8wAeqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgLYVlq2D6UsRsdnNkq07kItztqTqglvnY9mB78DZucJ0HWwjA
	wSEb1NRFJqUvGrO2bPYHRW3C9FVPqblKCKy2FFs64uFMEAFlU2ajFWogRmxBz4kLXZ0Ib5ZR8Bk
	paOIuKo/4Eo7W6OOPFDOrsjkKsMOhVzM=
X-Gm-Gg: AYBFou1sWW1osDmd0Aj162a7ekrHrbsnOpm6tdGdWAqCQbx0bHPh9lelWCMBwJS4ZD3
	tY525ZQU0gy//hhn9nMc53eTwPsFCN2jzYyX/Hq6dAWxntw6JgVHDJovCP6lr5zmTGIiPLBp0+i
	g5+8YGknAerOOK9iqSSbvdCvmtPsN5UYfe9dnxqksft5LdE+kRtavTMGFn1m9awdJ7xO4+q/MY0
	qt6JmXSA8SgZHFUeR1ggYqZWt6ZksLtBivpjK95M/5SruJIY36uyWvETTREyujWOovXsBHABp8D
	5liDV3b4HJp6nzR92ihHs2K6U0qZRwKl4iR3MWYxsDffwvb0AjizPq3BU5OXPVGCG+P46JeDZks
	YAqUgBHhPdSbK20W1+uWtF9vpyrIPZxxzPNYRKt7gvDpMhOExfgn7jhKorht4zQ9HDfghg3+pQS
	3XOA==
X-Received: by 2002:a05:6a00:aa04:b0:885:fcc1:d55c with SMTP id
 d2e1a72fcca58-897c7ec5a0amr846999b3a.43.1791529403528; Fri, 09 Oct 2026
 00:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-2-phucduc.bui@gmail.com>
 <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
In-Reply-To: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:03:11 +0700
X-Gm-Features: AclHuK9K_mTmShroHQ2NxfLYvmjGvCBUVZdlzaaqulcpuz6FtNuEKnD6JjCP8qA
Message-ID: <CAABR9nG6RyjjmGhYKgMJrjbO+E5+UxBq5JBfeoG1qj1VxOZn1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ajay,

Thank you for your review.

>
> Should mt8195_afe_enable_main_clock() also check these return values,
> and unwind APLL1 if enabling the APLL2 tuner fails?
>

Yes, I think it should.

However, since I don't have MT8195 hardware to test with, I'd like
to wait for feedback from the MediaTek side before sending the next
version of this patch series.

Best regards,
Phuc
