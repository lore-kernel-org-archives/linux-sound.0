Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A5274669
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 03:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339092; cv=none; b=RoIX/A7Qhqvs6aDQS2q+3QYCuJdW/4eD+8Z1vG8WSSjlUhOCUZruW/JGHtcbMDwwc48XcVAcUVN7uRYdZ+qNtGFwSS8B0cYyMvZqgSK4qSDi0jwv1jOXJgj7ZA5c8ub7yLzkdJZ5fdqA3jYXEpFqNNvpocuKS1F7opBw1/GjKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339092; c=relaxed/simple;
	bh=qrrddUg0J/Vj3a3W8m/yYJDr8fLKEDPh9eHraAS8sLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDPhjIzn5EX0F05LURJyEmGGXRTv0pTy5OMOpjKSIrxzgsMEIHREQYbekMp76YP6Do78rZFprJhNZQhqPFfH0NZGv7UWyn0QS1GPDmUU/Xk0B08m5f/v+2R7kXTL6hHVK6mM4WD/oNoZW+yMeEGJxiR7SDqQIs7w4XYcq9ukUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgBtSSyB; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgBtSSyB"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee1a3ef624so35386861cf.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 19:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339090; x=1765943890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=;
        b=JgBtSSyBJA5mzEIQIZHh8R6Rx6bRaxpaDWAGcKeH/mkLSKuaCh7Q9tdHKLJ7Dt6+aD
         F7yOF6TwAavII+UHDa8IeFGVk/KzkcjiwDq/vaysMSBihsyKU5Q/Y3AcqHCehJa0u5vq
         iwh82EnAauyW7uYi423k8yx3G1rZhAzeuOzrDgvop3jiiNo8EkYlo3aPofLKXSJ0pNtH
         3khfD75movDW3Msvtyxf0Z8TRZsGmNwI4BPnCXplGm0AVKa+jtzndhkaxh+akZGJBRVf
         OAoN4L1Ck3pqpWHYE8cUb8KbjYrodWkvNEpPVqjxWPEzFpMxI1w6T3oQZMKOqF9tOKkW
         6zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339090; x=1765943890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=;
        b=WuOZHc/KnpN3eUcp+POL/FdmQpb7vOBUUncdewPonFrX+DbtTlRgVEG7MMH0eUfS5c
         jjotX9Wc0IvRy0OnbwpJm8d6/A3/tr3aRQePX9Jrdmjl+XLSB8YX8GhpCwBru5whd7Fs
         a0Hnc3QBCLmF2umK5g02/YHU8c6AysncBEcbX1EB6gw/+V5ZCD/Lx+/1Y83F7ygHNt5A
         kcFGkx3XxAF1Y5p77EgkxirnMq+utEpg00pnNlds1RAVgM3MnMWVtP3VrrSH1Mih6Ol9
         9kNcGs1D8kZinGPGZimn3LXoL6w7OonVPfYPLdeahpSzhHxqyevzXiT6tDRj5hDa9mWA
         ws8w==
X-Forwarded-Encrypted: i=1; AJvYcCV67J4O1fR/WENB66RoN3n2Bh9PFR5WD6YqUN8XfW+soAxxg7i/LwJUT73uNMBNimlis/A5VHhEbyUGtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7UGRRbQRz5JDng7hfxB50PLwVVqQJ2+DehM5XLaXNM0urbeu
	dOrgByT6GKn2VIQQlpMgZ3LqtP7c1HkPHGnfJefaahq2SM1q3xEwjWJ1E++Kz8hb3S95yyQVe08
	0jj03PQVXyduj532vuBSyaREbnvYvxRQ=
X-Gm-Gg: ASbGncuNRH4S/BWCrn9H4JY2VhW2Ava8cP+T1DXJ9br3m70U9YJTyn4nWnp9lor0hDX
	LLItGgYKo11e704y9k20GohgJo2ToGuNryzkA+PC/9DJcTb2f09s3bCyAuRG7ooghy/+gNQLrbU
	79tpMmPxlOx/hNmVDALZrSb1ZHKViWrjziSBbXrH1oVi1Q94uqhkCXdUAHSCXIWGOXOVEVv0DHC
	jcgHhK7TB8wJ5hqQqaMQrfbxduDkaxAjoT0DxvQcsmL8m8x0IaOkikxZSWpGGJnQEBVvnHCgSfP
	u/YVL67gceM5iRHPnn8E6d3/nrn6WlSKtfWta5y96tNHYLYVt03/NPPwg5X5xj6Mf/IfmyonrSz
	hJ3Qe36FmhU2xGhOqimqQHLLskE71Synszq8=
X-Google-Smtp-Source: AGHT+IFGSPpDaGsF7GV6bSeqZjzx0wih4VR146dqGL5dRtKu2H9I9xlLneXMcdOPKYcfgnDqQlmhKeVlt3Ia1lJlppw=
X-Received: by 2002:a05:622a:5d3:b0:4ee:1dd0:5a40 with SMTP id
 d75a77b69052e-4f1b1aae5b4mr12728361cf.59.1765339089481; Tue, 09 Dec 2025
 19:58:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com> <aTjZc3mgu7CQOkDU@sirena.co.uk>
In-Reply-To: <aTjZc3mgu7CQOkDU@sirena.co.uk>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 10 Dec 2025 13:57:50 +1000
X-Gm-Features: AQt7F2peQnceaEJraJhL4gaHZEV1D4IiSKkpSo2-8pS48v4HYxCHrY9kKA6UQpE
Message-ID: <CAHgNfTxmYxNaYOdGK4Eb4ouCqmUCjVuhzGdgTAL=+ybObqrCmw@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Dec 10, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Dec 09, 2025 at 07:31:17PM +1000, James Calligeros wrote:
>
> > Imagine for example two codecs sharing a bus. When one codec is
> > transmitting, the other must ensure that it is holding its side
> > to 0, or data from the transmitting codec will be corrupted. We
> > can trust the "idle" codec to simply do this itself, however
> > this is undefined behaviour. Some devices may leave the line
> > floating, others still may pull the line high. We need a way to
> > control this behaviour.
>
> I'm finding this explanation quite confusing - you appear to be
> describing the situation where two devices simultaneously drive the same
> signal which would be extremely unusual and I can't see how it would
> work electrically.

We are trying to solve a few of problems here, and one of them is
a bit odd. I've probably jumbled up a bunch of different things here.

We have the use case where a codec enjoys exclusive use of a bus. For
these, the codec can transmit 0 on any unused slots to hold the bus.

We also have the case where multiple codecs share a single bus. One
codec can weakly pull the bus low when it's not being actively driven by
any of the attached codecs.

However, a number of machines split six codecs into groups of three
across two electrical lines and then OR them at the receiving
port such that they appear on a single bus at the SoC. Because the two
data lines are ORed at the receiver, we have to guarantee that line B is
zero while line A is active, and vice versa. To do this, we set a single co=
dec
from each group to zero-fill during the active slots of the other group.

> > Thus, we define five possible bus-keeping modes that a device can
> > be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
> > (actively transmit a 0), PULLDOWN, and HIZ (floating).
>
> What is "explicitly disabled" in ths context?  Why aren't pull up or
> drive high options?

The OFF state was added so that consumers can explicitly disable
any and all bus keeping if necessary and supported by the component.
TAS2764 and 2770 both initialise with some bus keeping features enabled,
hence for this hardware NONE !=3D OFF. I suspect this is the case for other
hardware too.

I neglected to add pull up and drive high simply because none of the
initially implemented hardware uses either. I can them for completeness's
sake, however.

Regards,
James
