Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CE38F638
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260631; cv=pass; b=Amx9i7a/XfMgKKRoCmachVd47EEYpe/oNRr05vkBGY0NXNzhbfD3h0M5So7dWYzTn7323gcgue7pa3DQ3+iQ6nv+cBjLmSXy0RfRhlN4W1bTPNoZVkv5nbZojBRmSBRcYYWMpsT8uixBfEi9H0ThJf6nXJ2amGLe44xaf1Cn0T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260631; c=relaxed/simple;
	bh=ZyUgqPyLHvGI5918i4ruBtOSw+H4VUygmiU56D3iW6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZ9BIImMgaaJhoyQg15tKxwlvuAAs1wsbrwnj+/P/zAVjpXrebywLE4jy8umdqoe8Di5+nCsfGFMTtYyE6yjrkrnPOcd1aSRWP63e5RlTWYpEgsc4f/AuG6xCcWbOI6VdPE+mef/ejHftpA1D+Jw2GrcxWqCYZ4dkIVmixhGPJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4e7gU1X; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4e7gU1X"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c858dc05ee3so509091a12.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 03:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781260630; cv=none;
        d=google.com; s=arc-20240605;
        b=VaTfSx36yDncnG5JDk3awmecKqVEJsxdWJAxyqyBAsV6caSPKUHtGUsLx57c2ubDc6
         kJXlgqJdnpRA5L6TKbdvp87Rh+gal6EnMx3Fse6K8ycBnazddcZr2X9MZvJFswszwPr9
         lgzUWnhvEr66ZZHsTjTAVvUrmASFVNBWTtSA3EUOhWfX3D9w0AeTc3L0fhen7rKH78Sa
         sxMTEkXglEIpTvch/uYAOgxSA1A4eOAfUUdU89urejVs/esRezeAY0y8p3GxISK7rj0J
         2m60dYF/ZnzpGqlaeKVmogUSUOjc7qLOj//CjAJiLpqb0q3GEjOuewdwi22cp3tkjtLH
         eEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yGmOz1V0n8WCv2WsgeGuXHK9MeZUgyY4mCLu4WGLECg=;
        fh=zs+5FuOOUXleyR0lW0LjXnYr+NI3WHWCmo/NPZJH3NE=;
        b=UqWPe0816ZwjPerwfqiq1MiPvfOpcvVCJFo51m7gan7G9crVGuYuOrVOxQ+XmMc0On
         YNRErpWQ3olHQaqon/95STqF5h0gl+pmjXlhPXwpWeDCYUJHNys2S6w1LeZ+icxo9Rge
         0muwauETB6QYDQfXYlX2NMGTs5Ld+QicXsRUHNW65wq2WVxlDrs+pt1g/gY9JalNZIbN
         7UTlJeajs5UOwfLC6rVp5W64+6R/rpXUSIaJQ2HC4ePQFLsaBW0zLUf+Y286sjSuUrv0
         mauHxDPMTysHXBaGeGRY62X5humACL1Askc1vFwBNG6jhubzl1cmg1JwzsTpZqqbQU/I
         aPxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260630; x=1781865430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGmOz1V0n8WCv2WsgeGuXHK9MeZUgyY4mCLu4WGLECg=;
        b=i4e7gU1XCELzVu4fRUArw7adcOzqn6jj7nTNHPzti6o1tAPZA53n5qKipnQczJgiDV
         Hy+hQTTkvBdWQ4/TickYGqioJdksmrR3dDym79xp91ZwEb4sItHbzNv3TyPJRfR8zY2N
         4jNH4NaWg6FPT07J8AvCVcRcGWbMEOm8HLttHXfRedVFmUBMjocaw9m+Ivqj47/ORJmx
         S3tJQnf2nnLzj7jESzcnI+HOCSkh045UHlZB6ck99gfU83yDHLmIDfFRZJbBCru3t2wI
         9bapsQCpVb5O5z+7xarGz61bghq5jRFXOKkB31REZr1nfp9Ol4DIW/3v4jtI899ANSJ+
         +itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260630; x=1781865430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yGmOz1V0n8WCv2WsgeGuXHK9MeZUgyY4mCLu4WGLECg=;
        b=IsUGrUk3WxHaIZDog7c699I8oeLVuNc7IDAxGwNVLGRDaGx9aoQaISCuWDfNQ4kERV
         aVzoIFFPMAJv/vISNyHko3rJDwB7mS+GzyHrfkv1cfZkpcAbhgh9OBLbRiXaLC2te4GO
         P2yynw9nZreNTcx9yXYyM9Cm0TJXQZk7MvnYNp9XHkNsc+wGnAFegE2oSB3+mcWUP84l
         B3anRDSkkxdGkJOd6AX4zq5DxcFvPZKLJAo+QuCPUnUKBbvdbCC44laecc0meQE7Y4Et
         EPaWdobXTrH+WAq6Xzx/nGt8vTpHwQxtWmu4BAeCjfDVFSToUsuAykOlmdvLt/fyVd1Q
         QDGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vuzOk+P+Hmp/K7Re+GhS72mJhvVAlu7cD/ItwDGMPQQjjw3W3VJYZwmluHNe7n29RVta0DcQbY6PIqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdVU8wJOv0zNFxJ1dCEMErHBLWMC744xBvv5Pjkain08Ie1uJz
	YJDFHnR/OD6OTKuSzA3Eo+HEw3/pfYEMFiSragNYaNN0d2N5gMpe/vJT+uhwvmn6UHLNd90WfGN
	5t4uJxCNe0Lmt0CrEVUVVuqujJUuAjgE=
X-Gm-Gg: Acq92OFasYbvHCMUq6oqFXo6A7PvclVlvSE8XiyUV3ew9SiPsBUjfXLjfCDokMPQo+N
	LKFLQewKy2l8Wc7NahoFIK99zqiM7VPcEMFxzaoLxI//Uuv473MJTIrf6q5ya2xz8IYi0p5LDmG
	dPzopXZX8A9dfuarUWxvSnXFx1CazECQ57Fii7bBpubwl6i9AmmEq5OPXdWVO9cIVV4p/ZpsB90
	QYwhKmpSNjN9qfre2ERuskINlZJI9iafakL9N3XkRMWrDmGXRJvz71xTShcJKG7/C7bJKRH18We
	R4PeV9EDHu0CyhWOsw==
X-Received: by 2002:a05:6a21:350f:b0:3b3:c7e:fda7 with SMTP id
 adf61e73a8af0-3b78406ebe3mr2900723637.39.1781260629920; Fri, 12 Jun 2026
 03:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124317.38046-1-sammiee5311@gmail.com> <20260609124317.38046-4-sammiee5311@gmail.com>
In-Reply-To: <20260609124317.38046-4-sammiee5311@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 12 Jun 2026 18:36:57 +0800
X-Gm-Features: AVVi8CenVHdc3LE6HJevD6aErfCNA_Sk-ZJA5DP2qrNShUhv5CBfoCuI5aCO6Ko
Message-ID: <CAA+D8AN6+oQ6PRNS-KYd42QoS-r1WhGqcafNCewLuXpYsGW4XQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: fsl: fsl_audmix: Validate written enum values
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:47=E2=80=AFPM HyeongJun An <sammiee5311@gmail.com>=
 wrote:
>
> fsl_audmix_put_mix_clk_src() and fsl_audmix_put_out_src()
> convert the user-provided enum item with snd_soc_enum_item_to_val()
> before checking whether the item is within the enum's item count.
>
> The generic snd_soc_put_enum_double() helper performs that
> validation, but these callbacks use the converted value first: the
> clock-source path tests it with BIT(), and the output-source path
> indexes the prms transition table with it.
>
> Reject out-of-range enum items before converting them.
>
> Fixes: be1df61cf06e ("ASoC: fsl: Add Audio Mixer CPU DAI driver")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index 40a3b7432174..f819f33ec46b 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -117,6 +117,9 @@ static int fsl_audmix_put_mix_clk_src(struct snd_kcon=
trol *kcontrol,
>         unsigned int *item =3D ucontrol->value.enumerated.item;
>         unsigned int reg_val, val, mix_clk;
>
> +       if (item[0] >=3D e->items)
> +               return -EINVAL;
> +
>         /* Get current state */
>         reg_val =3D snd_soc_component_read(comp, FSL_AUDMIX_CTR);
>         mix_clk =3D ((reg_val & FSL_AUDMIX_CTR_MIXCLK_MASK)
> @@ -157,6 +160,9 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol=
 *kcontrol,
>         unsigned int reg_val, val, mask =3D 0, ctr =3D 0;
>         int ret;
>
> +       if (item[0] >=3D e->items)
> +               return -EINVAL;
> +
>         /* Get current state */
>         reg_val =3D snd_soc_component_read(comp, FSL_AUDMIX_CTR);
>
> --
> 2.43.0
>
