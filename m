Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168C20DD42
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222659; cv=none; b=eMcbavI9+2rdItuC/p9Gu+H9dQ7mepyyIlXMO1fQns4i5yl4q+uRgZf6/+WNeCO5LPCDTFO6NWiQhL1Kmuwc42c3e3ukDqA7q6dF1//gAujW1F8Us6yFCcIvLox4t7g2sJN2Ur+4x2IbWNMWIFviz1zHJPA4x2HxD8vVQ/BNPCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222659; c=relaxed/simple;
	bh=OEA06nTeAUGwpAIDsE1dzLbzSs+2hxTR5wfFGk+yki4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9ridU2HC8Cr8cFudBGDK4NZBVmjTMaXOEOAfGUM2vgVwwrfF2Di7VVUil0N8DW9yjSKJcIj/Z+5ejIsbmjEEYr7N35H3g2kN3fZeZnALnTMXAxNCuxiTbjJphS08saf35No9NLCQFls12ALXu4/wzBLyrpD/WUELpkk1ZSrl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T1RtzjXp; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1RtzjXp"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70da75014b6so32437826d6.1
        for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756222657; x=1756827457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVabfoeTRalARdFdnvAT75q/NwmfuXUfzr/tmDDydBM=;
        b=T1RtzjXpDN4CuE3xqOIE6vNDLflVeawOsXty1KZe9zHHAjHKsrKwh4u6B89wOK2cFB
         93n15bwHjtgUJTZwUhAjNoa18mUz9Gfm4Opf13nkj+ToumHHCng0I05uvE0r/dTvNtA6
         68lOP6Qcx25bReHt+9N6luG+rQCT0qGQ55HpVuhBcMwJgughGlMOPDjXdepOz8mw2qII
         2k0/qpPtkKhTHRCnRL91OqQH3ujpb5Iwn1rB8lPIYBXlGIzCP4H07Id/e/I7f2NeVxNh
         3ln7S4J0BaOBeugfgM0Y8e2kJ8QHC3AcEeAJf1NcXLpgIuutbYlwpbMqV7g0sKhj81+E
         11zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222657; x=1756827457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVabfoeTRalARdFdnvAT75q/NwmfuXUfzr/tmDDydBM=;
        b=rUQ+rG85NZOa2MhAeJct6aKPs/XvQKt8mzbXqF0JkPfAWAvemTdVXylwA7K2siGQz5
         kYd6RmL4yJUKPEY0gUccNdzS2yi/VWYLsM8w/OkpZKxlUN5qQ96vO6mOrZfCoIqzbZ1p
         T+E8chJyx4EkFP5s14Vd46cnzONa6HZC6z441up8Vyyl8A5NHTRYiFNAmd9h3+v+dTZx
         2s7+Va3lxG4abik5MLcljfd+bd8RYk9IuBucJ3K803eJHQz/XRclKv21iXTAF/8WE0QW
         fQnn33VNAUGawbM4qOMpXVi2kD2fsD7WBxevp4Cj7N4RjuXg73yAveCk1Ryvv1lvRHh+
         pc/g==
X-Gm-Message-State: AOJu0YytDObS32TnvxuX1QdH+Uuls+ldnQTJtty4Pd2CL8UWtOaVqcvn
	uVPy0tS9erjdxs9pVajqLCkcopnGmqYTlH8Ki798wVGImr0PgiQbYGH6Q31EZ8K5Z5RNQQT0ue3
	WSgOEmHjNpA2uGbQItsEtH2RFZZ9yFo6GLgsTUADdEm7/+wl30uyiBc4DVw==
X-Gm-Gg: ASbGncs44YbjwaDy2+dhdkbODCjPMLLbjwRPPFI/gq6uq63sunXOm3xSWxGG6ABHUpF
	Ddmy63ABRujpHy3TitxfLwveVnM15prxw9Oys5AkoqodtDKMuhbgvnsB5TzVaFJTmTTTrNNO18J
	0fEsu02zbtwEYglFTyzNYGRCJWFtS56RXLefHt13d/2eyVTkO5PzwVp9d6yu5PIcpbIG66vgJCN
	GmBaS4=
X-Google-Smtp-Source: AGHT+IGn4/HsaQzBgXtTuWAP/lpgRhFuhANcsb2aUMcUAyUN7Db8Yk7JceHH1d57Q+3kX/MnS38N0ue+12CYe+gWZKk=
X-Received: by 2002:a05:6214:c65:b0:707:4539:5183 with SMTP id
 6a1803df08f44-70d970980e6mr168020966d6.5.1756222656452; Tue, 26 Aug 2025
 08:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826093725.2432153-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20250826093725.2432153-1-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 26 Aug 2025 23:37:23 +0800
X-Gm-Features: Ac12FXw_ibROh4a5HKwjNDJ18I2fbCE2E5fZrhUQZkVnB9izMMIgm1fAL4Zqo_4
Message-ID: <CALprXBaHBivkJfEUaMq0zV3nycidSJheGOVXaOhwFTi0iiQhqw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Based on the suggestion from version 1,
I forget to add the tag Acked-by: Peter Ujfalusi
<peter.ujfalusi@linux.intel.com>  in the v2.
I will send the v3 later, thanks


On Tue, Aug 26, 2025 at 5:37=E2=80=AFPM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> Add the missing op in the device description to avoid issues with jack
> detection.
> Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
> v2: Add Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for W=
CL")
>
>  sound/soc/sof/intel/ptl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
> index 1bc1f54c470d..4633cd01e7dd 100644
> --- a/sound/soc/sof/intel/ptl.c
> +++ b/sound/soc/sof/intel/ptl.c
> @@ -143,6 +143,7 @@ const struct sof_intel_dsp_desc wcl_chip_info =3D {
>         .read_sdw_lcount =3D  hda_sdw_check_lcount_ext,
>         .check_sdw_irq =3D lnl_dsp_check_sdw_irq,
>         .check_sdw_wakeen_irq =3D lnl_sdw_check_wakeen_irq,
> +       .sdw_process_wakeen =3D hda_sdw_process_wakeen_common,
>         .check_ipc_irq =3D mtl_dsp_check_ipc_irq,
>         .cl_init =3D mtl_dsp_cl_init,
>         .power_down_dsp =3D mtl_power_down_dsp,
> --
> 2.25.1
>
