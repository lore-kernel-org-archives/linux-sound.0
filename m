Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599065;
	b=BQ0ZyTstfLkytIelEfXwf/14jcOtX2KPYN3MYsVAwSYpk7qv63bzTADe2iZM1Ku52fWb
	 Kz+RcCFjUcqnbMhX5bICqYTb5gXSGTDFso20cuoje+L2h1GmZAmA7vxWBRo7khM4RiljU
	 9IH9qsFLm9LkcdMkcuZ9/vquInB27eOHU0tEpQbuvhJ1S0rtXjD49dIDT0cdSJoCeYuPb
	 D5p6cr2VcBqJ35WpRDOGtjLw0Nuk7a/kFhCFzsfDocHqeEd5c114omzD7FNHkRxw0XSMI
	 KhGxCz9slVzrAiNSrT96UY9y3/EZtqju3ae7juvMo+5smMuOJw98srihviZph1hPfaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
	b=bW1L0F38nNYGpHiB0A5dNy4gfo5rumjriCT9RpK5ffPTuSWuYv8xtmV/+SZdz2BHAL/W
	 MOl6PSKMXuxqpKoS57JjUBtYhJyCCt1OFhfFtzoE/Rks99jqZZnwxBB9l6nX8zjtu6VG5
	 cad789hMiHNKJYEu6ijk8wX6Hjmdrb94xS6yOtMSFguEda3hKztPE+t1kwTeutVOmp77o
	 X2X7p5oaJhzN90bHuSzLwJdEfZIvSLM9BkxzbRR5l0a6Oj/Exb6K5mYCyFW7tkEcrQpzR
	 ZJakSWf7QpQ5aPgYl7WmRgR6J/TxD82BG7IlzLKWFVX+U2st9yKS2+KhnbTr6lKJFnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1arx1Am;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC1606A68D
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEC1606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1arx1Am
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3346483a91.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599065; cv=none;
        d=google.com; s=arc-20260327;
        b=Yv+PTz7q50rNFtld2TNfhH8WKS2iDIotiafqfDdxE52/nc6kf3KXXMZiTYtU7/Vd/c
         JM3I4uexZHoo8WmA0e/NBppQUcSHD5kOplUn+BJ+KdLQViU/ClMpZr94KYI/9edrnDlG
         7PFNH2irrX3kYlRP/AuY/qt3l6auF/tlDDaDxNKikdiKK6MsNYmsGEtJDGxAcMLD1W/Z
         x8KGznpGSUBFWmmEE5KYukMxON5/9FHJt9znpfIvr4H7zFXgXfuKFJeQ1qIkXtxZaw9X
         fpKM2FQcjmXUfQYsFw1CYdivRzelMv2PawCv4GDHRE3l8DwFtnQaYG0koBdYn9VqiC+r
         6S2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        fh=b/lQlUMtQcB4n/vmM/62hIYT9adcXWtwOGgsOpBi7Hk=;
        b=IXtdLIRoQnbgWLoQwwN2AlmKLpw//zJ/1VMwAHIbghheVaUtVoAC/aKvKv6YrdP2oK
         g+YRsdbdbzIsfg2d3XlKRozcy6V2g2/cIwpg+j21i0tiV4yJaU+qQVSnUzxSHuYa4kBh
         PYEeGejJYg1AZwgwfIXzFUFMjrp/xue9y796Gm2FK8ktcXwy/+XXmfy9uqxJ842Tugob
         FfbyiStn3ei1bZVIYujavyDaeChNoO+0Qh6wPj1aXc7AsYhb4ywLbk6x3fgu0BaAlM5J
         a9VrCCH7If2xj4PK92h/6+TPMFH76b3wGIgb7EU4+qWimQLK1uItcTXJ4GwUyGddaR/0
         QuAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599065; x=1796203865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        b=c1arx1AmqQLg+pnsWJ0vmwAEMpxCfbamLsHw4B5/EGWGbTt48fKm7MEONo2g4/Va7Y
         CZWWtQYZIG9s0HTLtPXxZhNw/iVMfPz0YnmxXDfgJIUB06/XG5WVR65XVou7VpMthgLi
         TIDRxqUSoAQ1rGb6Oq2jZSLHXoYXHkgEaUFFWgqPnPxS9ObUvIKL9c83EGNqaQJM8SKt
         g3Lz5+BCOlgQi8fF1vSitob6WYhNIcguwTMQ73XD8gT2joRBIWlBLm4gyaK8bs0iWRPp
         XfAHnM1e3TgA1TTm3meZIIlBjzG5F/M/eBbDp1RyPJbBOYFwMhQZwQIiRiRLRTTa9QRN
         RwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599065; x=1796203865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        b=NFgJtBcO/KvWmPBmLH1dyQcaIMgxrmWEaWxSe1BG+nHZQEr55kpbW5UZyzHfl6v0dD
         /DwGzy5DPtBXpWY6pMUy3kRYXWiYoUToy6YT+NJkqF+FinTuoiN0ZNMb1LuyiSOI+/RO
         NVEd5HyeecbqEociwiA09QS1/y3ch8oQ1RehQw3ZH1YS4My+udnSlJ4VIWWlXahjB2mT
         bbaJQ4qhbwkydA/e50Y0uxf+frmgB/3ix0I1XD3uD+587AtDqPoZp/wmrFjodW3xSIxa
         rflTsHOPkagtPAAZSU1OMv91kJo8JW+NP+41f2ROPAwG8K573gvswRwtsdHOmo+AaalF
         KLOw==
X-Forwarded-Encrypted: i=1; AL+hErHxehyisNZpjxs+EtmolOICwvspakmMSblUqZSg50skFlCUvM/8CWzBmuwXXBlKmGJIcigpiByHagIj6Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+h3Zh2ZqrJYVku7hqFuTWHsbel6sIFvAlK9isY+w/40Yj+OJsQ
	4zTMpkfyVKgKj9IzBoHCeMFupGD53h9enUnxWh+Nsk4PFYv0c9ij+cntB1ldETEJKoL4EDzuGXs
	oku+153kXz+s2C23NKnZ+V/hYaDUztXI=
X-Gm-Gg: AZFdTZf/2GRKMpy38UufMfClh3srQ6WL5R/1Cm67P7zb3aisPQV5z9uqRfFFTzzb984
	FOHAzT/t9JoK8x9/PmfpCSYAAPdJYHSjRuPQoacJ6aHzJBRff0UMrsyC689V0LlU3wTmXVwEuIP
	T5XJUtBoo3r7PIvPLJ2RlCAuIOVJzIOwrHxKGYp98GOevw8Rz0IrDaUADPp2aWGHgy4MTKS/71k
	SimonGW21oCFr4vR98Jjt9pGI7nXaTQoQxY3GL2bdRIbs1ZFGKumlBjairfG3YqJoxwrw8dlJIF
	HAPFV6FP42Y4TWPai7sawn48Pb6yRlkkb7GUqXFyLQ23Ru7+sbPA7O1IXjoy9qxq+NlOHe3mg2X
	zOqb/t7om9QNqv2z5gKG/vWB8R5CKq0+LEPBt
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b41c7b60b5mr15460985a91.6.1795599064574; Wed, 25 Nov 2026
 01:31:04 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com> <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
In-Reply-To: <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Nov 2026 17:30:52 +0800
X-Gm-Features: Aa3M54p5bORiV9mV6RZmN9_zoMbjiqg8A4INJOiWefrA-5NYyURqcEaFKCpWRUE
Message-ID: <CAA+D8ANRJT6Q+-sB0KCN-CEsPRQ2pX-9CVWoTNX33aSKjvAwVw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 4:26=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mi, 2026-11-25 at 15:38 +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Replace syscon regmap-based DSP reset control with the kernel reset
> > controller framework for i.MX8ULP. The syscon approach requires direct
> > register access and creates tight coupling to the system controller,
> > while the reset framework provides a cleaner abstraction and proper
> > reset sequencing.
>
> What do you mean by the reset framework providing reset sequencing in
> this context?

It is to use the reset_control_deassert() and reset_control_assert()
these functions.
'reset sequencing' is not accurate here, this commit doesn't touch the
requencing
Should remove these words.


Best regards
Shengjiu Wang
