Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC715248F47
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770843; cv=none; b=tZ+uCM5eXq8l3eTSaq6XOzbLnMA4oxXe5sdT6RfmIQucDuTF0a39hntYeu0kkAeQfURz9oiFp3D7kAO8/C18rD1vO89Mb/TIZq15sDzAwp7r/6aG4FbX2VnixJYxuSfgadxkpNQN9uQEXv/m6tSUtwfS1tSiaAeRpyWzcIs6to8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770843; c=relaxed/simple;
	bh=dK6m6pQsLT0lz+3lWLjt2Ru4CXH1Gsy2iAC48F/mVVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0dM8CN8f/Q/rU+zlE6caEnhryDCJ7Ljx7r43nZqKPZPu8BIBdTuwADDNjrsNZJ/zDhuGKana3034yTB/Bsm0fd5+NEdlKEaPuD5EGyi9KxiD8Pf6liHQz5uH56JG+XJKtFP202cnFfBBHGB8QZTO8HOYuB+mhXgUMmqRBuj1No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdLm+VUg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdLm+VUg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so684712a91.3
        for <linux-sound@vger.kernel.org>; Sun, 14 Dec 2025 19:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765770841; x=1766375641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs41d7yCNQsicDzPOtK67VW5w6RIcuLsk1wC6vBHoOI=;
        b=HdLm+VUgkfvKBEByEgmEAuW27e+14937H6mmpZMt+fxSMBNEncNRaGCvJ6a7Mg0cLG
         hsak6Tc2WLuBKSqcCoOu+HH4Rtrha5ypwBvs/Hk1TO+dgaoj3ZBbfKQJ+1CYu2D/H7Vo
         Niwt/slvHlmUPOsxyvY5pxBBGM0a/n1Ld/h5g2zvs2C2V+vOUT32c8D03tBdEd9N7P6D
         A7lYtQQDajV6FrCsFIKuSdikzw50OpP05FSBt1I2gLd01EEXZ9tZuxlVGaIaC04fJ1J7
         kdpeGZHOCUu0uJ26mDdZJkdAa1NqZLp3LVQh8oZXOfFCD5gjy18BRa/4uLXUKP1hjAMC
         nElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765770841; x=1766375641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cs41d7yCNQsicDzPOtK67VW5w6RIcuLsk1wC6vBHoOI=;
        b=ZfacZoJ9SFPoDuz/Ud/ofjB1zbHjpHlBwpDUyHtoHmD5Nmr7XWoZdzRp1pslt+xkpK
         ipEjjlvwyMei0S0Ot/nVe6NUGQAg1NRCkmgEcA3n679DqC+rc0/P6FPFNtcvdXd5to3I
         y5NOn30NgS+gdWUpq/Wn90vxRQLx0Qzayo5IzNVUpTVbEfSIaPgNeSDPkwH9LnT9FkKP
         xRSqC482E3u87uh+tOAVN1YZRdiaikj2fmF5WoQGxaC7ws3bsTsXsL0xhTnGHoN5/0Ng
         X5NIzf67g8du9Rom8iptVhS9MK80OhNnX39M94QOaf4z34YtlYRG6++YgwEI83KmO22a
         VL5g==
X-Forwarded-Encrypted: i=1; AJvYcCV5F+iqf0YDwunSqNcU7z7Io2Bpl8TVaERbzzR6H304xScRxBRO8HlKAwen+yehXmHvbKNUMFcnNqAHxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqL5NBUtZ2d2ioJ6y/7kqiPhjPXW4C2fVrro2Wg9+rgBcZ6cW5
	p4hOL414HgD7c9KjIJcSXstZ9AGkdqwiZtKgP7SgnBc+CKBovwlhSa9DiUj4Wqg6pS+X7/aZ1rv
	erUusYm1VDvTH6Z7o+Lg5DvbLfyygzME=
X-Gm-Gg: AY/fxX6bnq5XYQs85DjED4gRUIr4ASk+h4PpcrReI2wDX0hsByZx2iR45Ns1Hm1FYC4
	33BZSeOwoBRK2vYlLk/7H7YCfp+CuYItwuwyn3FAksSFSvhq7ZH2JkkJ7HtfJlhIE6DNXnHCuBn
	vRFUYZOyXy9RjAmUStRT+JK4tRYAYjtUGybEramndy5FfwbwgBp7RdrgXqKabpIGH+oip2keZJp
	3yLEixVp/HymPA6mk4W9cECBenMd9XrmEMj0t/NNfBXCUKubnR5HSMx8ETldIfIjDoASM7CfxuG
	dJn+vQ==
X-Google-Smtp-Source: AGHT+IGktv+3+C+sSak5S3BM24sHFO297gHq+KUTFjA6NjjfpI4d7RiO44sokmLBPP2KLBwlNfaQajcbNWc+g+LH9GE=
X-Received: by 2002:a17:90b:2891:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-34abd78d3a2mr7741666a91.33.1765770840967; Sun, 14 Dec 2025
 19:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
 <CAOMZO5BhmvC1_AhcKTerd1p6PdJ7+YLonU59CcHfmpTVavgqdA@mail.gmail.com>
In-Reply-To: <CAOMZO5BhmvC1_AhcKTerd1p6PdJ7+YLonU59CcHfmpTVavgqdA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 15 Dec 2025 11:53:49 +0800
X-Gm-Features: AQt7F2r0RvjI0X4IfZMMXkA086kkoJNbhuveSQyEiOdiJG9AzHMiJjCeaNWhWHM
Message-ID: <CAA+D8AMMDuakAXSUizUmxdbPZiD_kzTEC_gSS5FVCRJ1nxDHgQ@mail.gmail.com>
Subject: Re: imx8mp SPDIF TX does not produce a lockable signal
To: Fabio Estevam <festevam@gmail.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 6:12=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Fri, Dec 12, 2025 at 4:11=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
>
> > Any suggestions for debugging or fixing this would be appreciated.
>
> The SPDIF TX audio locks and operation now works.
>
> The key thing was to pass AES1 information.

Yes,  the only supported format is IEC958 in driver,  so need to convert to=
 this
format from alsa-lib.

Best regards
Shengjiu Wang
>
> In /etc/asound.conf:
>
> pcm.spdif_out {
>     type iec958
>     slave {
>         format IEC958_SUBFRAME_LE
>         pcm {
>             type hw
>             card imxaudioxcvr
>         }
>     }
>     status [ 0x00 0x0A 0x00 0x00 ]
>     preamble.z 0x0
>     preamble.x 0x1
>     preamble.y 0x3
> }
>
> Play the wav file:
> aplay -D plug:spdif_out  96-24.wav
>
> or a 440 Hz tone via speaker test:
>
> speaker-test -D plug:spdif_out -c 2 -t sine
>
> Thanks
