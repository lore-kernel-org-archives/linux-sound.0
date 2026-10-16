Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E0C47884F
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149970; cv=pass; b=me17KiYQD2UzIP/CE2EPgGAdROUXT7t5D0ClV60WVHNiMnpGKjbooBta17GcT6ee29LHxZwdBx4QRP3pfHKyZf/R/SnewR7zzOjlQhvGsVYWYiB/lyzZ1WjXeojGcYlkTFmgbTTKEz/24MPl1+003/YrPniG50AN6BTRkD9XnDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149970; c=relaxed/simple;
	bh=R7fc9o/O4yqhA3W/kJmDsBhaIBU4bJflgTG28U+KE44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVWrcd2ujro9tSJgcwS7+CO14Lq657mMMY7cn3D5iovMk/XCiSaUvJ+23Cwh2czrlETAp/Y2Y/GW6v1yxHb1hqOGdnbCHvjKcu6bfc1wRmeadjs3a/pSEjtH07+/ejgA3Jw/32ANMoSAGHizQma6y5EW7xyapZo1KtKizVRufmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDUOhPxJ; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDUOhPxJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e608cd460eso34752505ad.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792149968; cv=none;
        d=google.com; s=arc-20260327;
        b=jtAj0B09lCsyNmBB6xVAkflMs2XlT8fhNFHA3QL8dFvMZ+d1KRwxe73zQdir8wUZUj
         Dny0kBv6YJJJk3Nd6Zulq+CzH8h7+94YOoBdPbWHnu4t4Ait2tgTl4r8i4bdVma86xBi
         j98P+3YCAQ+SGoxRybnkkc7LsQqsVHGFDQB5G5n2sDg1d84Q+6zVeWlXbwjB18timbwG
         +PDIaQWN+jNwvjgknZXMCWIbgsNeNUkmlkJNosRyl66hKixMZ5ZERwWwk+MKkuNZw2nb
         11MIe4IewdrnBlccdmOfnzUxArnSRXvUYKdQARHgFrPHxYA3+A2veFJb8D+2OXNDMiPf
         yifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        fh=p6ulZ7AKYbRBUvvgrJJi+Kixy6RrNMaCdCg2r1P72i0=;
        b=LeoflvcH2Nga8IebNcWzYsjdrGNuVih21rG1uoOyjBt0L3nwMunBx5P8HzZ6y4F9Mn
         0JBhpWocun1g5FpFVLv8nWFFagFZSeW7OUGnT1Pv+62Yc/0/7cEr2I36X/kbiH8PYt2W
         lg8sOp9YfQdbjQaV1kJBxJ1pf1iA3S0aRcaqrfF9F4iNqW3O3B6AgWw6nRCsFRWKryBw
         x5CYONLiDdp3r8kOvJc1Sd4nC1YROSMSFZ7qx092l3fPs7xkaPZUcgxnQ7Fi9ztlnoqf
         peu0C6DY+2nzy5LNL6meiSgPCxmtRbiR/s/zOnvdF3KAKR1e3NfXyKdXKHE9hxNvpXby
         2EXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149968; x=1792754768; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=JDUOhPxJFfNqGzF6qKagGJ9RdRyuEtlDsg+3/BmwOi8JRKOFv69C/T58mLShzd9MLR
         P4lD88hLeJxqC/81P7wQ53ZoLv+i68KSQCpKcKcJfrTplRaSwkyHF9JOQS+TRyVtR2GJ
         ynQGWzn8Zc8IG6In2A46KxGeym75SzVyTOUSEG3ZzyQLMuuDdyep816xIYjogWDEEwp3
         3LywSes+jn2igaxBP5OqlRJ5hZLuboyXNJghCSwRjbQkzKZ9TkR7T/Hw9iZa6V/FBa7G
         JsLPrG8QIVh1537rgYtGIKaIpXnlHN3ECjvINIepxb/jmZxy3P1u65/S6l99rhkiF2mE
         3sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149968; x=1792754768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=R/Q5JE1yelqJpgHpAsws3den0cW3YkA6VwSmPCLSpM5GtAZb9NyfJHk4rOFCtUnCdH
         z7M+c4Jv4OrDaXk/IqoUnj3ZcW+1xcU5eL6H0GSXJL7wpbEtQ/jJLFotqoZ0A3CYrqD0
         GiHgSpg6kVyKTMxd0wl72nn77CNl5QnTmP0mXO3Ce92sZThI3/SKgilX0lYUpKZnRvG3
         1AORKwhpiNVwE40gcw3KE46cfGNNJcg68KE5RLZBWds+P/L57cZ2KPo688A7PbZeg1RB
         cqguFthlCjeFgSZkLUuvPkIugcVaTq8d8I3D2r9BlWbgcCefLs+XTSaeK6woBnkHNSBI
         YhjQ==
X-Forwarded-Encrypted: i=1; AKwUvBymBLp9PBzHj4VJg5FbYWuOLOZ8BXSc0NiBCe29ON1/wRDDSuCoYvHkc1uwmBhZZsi/kBu9BDPalm3kVA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlAOTY3YtDW+ThyouhUZByRsOJeAuZgfCx/ftLo+05ME3XER/R
	IZDJoRMRx1F2Xuk4f0jRyPKOviJOqyg2cL0sslQnSnOj+Vtmb7tyh9DtEaGKt9ZfInP8PG3TPnV
	eGn24hrAfT801RidEd459uYNtqHIn2lg=
X-Gm-Gg: AYBFou2ltg650EUqtguVK0EjpPlQYU0j4oqtf3wuiAIQSOU5UrkvUU6ZHdX6/OGYLoK
	U7kol503d3bkUlPjeUPpJV+6rhmJeemtallTt3K4LKO5KZHUlL1q+V9CB43T8wNhe4VBTboHoSh
	/5ptEA/xPIibkZHMUTto/jq73Su6mlHJmdeuWlYubJBjuyDtKHKhskGI6qLgzPbRDBeIa4+vusE
	aZtzxCig+FHFGCkvqMA1oJhD0UFuSpYY0HGLYvtS/gxgoWoHY84kJ+0iBh1AZzqw0SjS/oPxbh8
	zoI9gshhwNtVN2kknnyPtuHt4zUe2NntTR9MHBdrF/T1Q8jLthBwx0EEBdbL7fxhPn+ILu4Pdoc
	9xehPiBluIqOWXDAr9QYxw5paXHF2aiLRhelvTOHkgf6bNI9rDOvCFyrH1OHD+KjNmdrL
X-Received: by 2002:a17:903:11ce:b0:2e9:4e83:1979 with SMTP id
 d9443c01a7336-2e94e836527mr62789995ad.32.1792149967287; Fri, 16 Oct 2026
 04:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261016040048.506531-1-phucduc.bui@gmail.com>
 <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
In-Reply-To: <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 18:25:56 +0700
X-Gm-Features: AclHuK9bobvuHZz0ZvKJfKfhAJdiG3c7XQlmqU2uHEyUuNfyFRrkKv-rn3SiKZ0
Message-ID: <CAABR9nG8PeQS4GBGwENfHTRBUnroKYQiEu29iztix+py=Arprg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link
 as started on success
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> Can you please resubmit this as a separate patch as a new thread without
> the series numbering?  This is really going to mess with the tooling :(
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> Series numbering only makes sense within a series for ordering, if
> you're sending something separately to a series or a new series then
> preserving the ordering of the series just causes confusion.

Sorry for the inconvenience.

This was patch 25 of v2. I had only managed to send the first 24
patches previously.
Patch 25 failed to send due to an error, so I sent it afterward to
complete the series history.

Link to v2:
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Since you had already applied v1, this patch does not necessarily need
to be resubmitted,
so please feel free to ignore it.

Link v1 :
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

I have also sent the incremental changes in a separate thread, as you requested:

https://lore.kernel.org/all/20261016040946.521195-1-phucduc.bui@gmail.com/

Best regards,
Phuc
