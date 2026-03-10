Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCC443DA5E
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134969; cv=pass; b=h4z80u9SHvqmUqjVsrgtuLm/n1kQd8VWYiLr6UBSSqMi5Zs1MDDHoRXfuqdzW5uBhgIQsCxNrUa7zik2jL+GiOQcBS/6D2e9Fb4cRkfDg7FIBc+yno7G7isIbQv3njU2nOzz0Q04OVdcEtNJB1YP398zBnSFdqZk1KTULlJG5ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134969; c=relaxed/simple;
	bh=AHscdHA78qeOt++JLPZfp6HkGijGeaPg8RdoJpbvDPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTXCfuVOFt1vM/wV+Qkl5f/ZC9/QiETOzoHmBigtudAkF2iqGGu4i1PtcbICFP2KqvQatQuz0sMWv8Y0/M3lGJgQqDTSWTYFP2e1NkQ83IHp3GOELb0dMVo8S0ZELQQsiIWq3rC/lUMehAAAygTn/E39KsCzoSvOI3QYpb9VsOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7RdnSJj; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7RdnSJj"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso6985045a91.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 02:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773134968; cv=none;
        d=google.com; s=arc-20240605;
        b=QTbn9m84CYcn7w6EyfPeHbi2Q3vficBOSkJx4oThPjAmdiqNyJZeqGDQzHWli/XgVc
         ephSj1vQXCKRGrk0kMN/M6v0DKFYEGYmywpWjDqGxeM+AVZ2iIOAkzMdF7A1u6RFG7e2
         RU1GONArF6bmWVSee969pnDTm3hHt4WMnx0+/5qw5jhvMhqT50+qqHfaTOUdSPrMyQnH
         syJY9feMZSFtwZOVnnPW276IlzS0lYJXQHSJOobLnbarg1cfrr+TTSxr566sBOAbjUbo
         RC6SZfCeq0iJ0T1WO2tuj7mVQe1ePkMlx4jiUV6M3aL6IbvFrXIMuD9UVIhSHmpDNWwS
         8DGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Up7jH3yF00x8N37NnPn5JsG2anC4ZO7gjpanlMVKPOU=;
        fh=qkObwj2EXTXix12ByESMkIixkvImEFLnd3b1LrxqdBI=;
        b=h0RfzHeNwYTCgmmbD56MAEMJQm8jhFi2ylydQq242peQZM3qzYXidhHj4igx6njmVj
         hHTHJj//2XhEZ09OPef2iYr3249d08rLZEFh/aHu5GNT9Q9HNH/IpUoFkoTUhLfRtSOd
         BStp4PDJ6rTsEAySXvso+sK/kUJpI2CmYz/QxR44PdMHaHzmaSEeI3v7HfnJpoyzpY0/
         cI1FFlsgUwoEC5EX7C2dtnPYAWiPC+a5PF4xfRGZJVZ3rLkamOAGMQaUyGbiamgmBsM4
         FalYVx8Cv2elEy9PPt1i1HzO3iG03Leg7lM260PxmOWIJdxCpOoM19jCDoB4LhW2F2oB
         VcfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773134968; x=1773739768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up7jH3yF00x8N37NnPn5JsG2anC4ZO7gjpanlMVKPOU=;
        b=h7RdnSJj8sueD0v8IWD9qhE2XtQORwDTL3k7dQnjTnA4NNVijDPMFQV7ARsEN/snt5
         3Sd2o9G30TR+Z3UbbHkC4zjxDpCQRwTOBrVe+6UGeea7P3B9Wj7Z/jYJojBb6tnXi5Xc
         x9hISXqLXOKYE1+8oIK6xTbaOKxS5z6X8XV1OXnfcSec9qLqoIJthlKia0khmAUTrvF/
         yvFomAEVS9IyJZ7+NHE/szTar1cOzAkZKyzo4nW6Xpa1WvUN5cjRm6AuUu8pWZX6hLtS
         yiAw7ZSm9Z32kWKDKln5FOW5hlVH0bd9+JIkK0kTOggmqHXIIUnCdic0bJcJhi8WNAJ3
         qqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134968; x=1773739768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up7jH3yF00x8N37NnPn5JsG2anC4ZO7gjpanlMVKPOU=;
        b=CD/p06Z/LIMtOj0AhkLwFsbIqMwSmsr/crmd1HdQcsCgv5cl4R9b1egjQh2oWhUHtY
         oIod0xFFjFJ+RPpefx6BblO9Ud9BMkqWNG8mAnePyVk9YqGtTFY8RPG0iVhet5vULLQK
         4oIUIzvygsAuwZakqHlS9OhVxibQe/IKBG9OpaSwUeIMyCpYJlOWdrw7m0WlJlpr/lnt
         RZ8gs37G8VfDhTSgQHuuZ/Ia8/biHDCBvdUqyf4DO3mlqQP650UuqbIL2apPqQV6GIJi
         Qe3i3IlKP0+YscgegR2UNBQ4u+3OZs2RPk3EpJSgMARIaHslBcAFn6qcU1TcwhSI2eED
         Euxg==
X-Forwarded-Encrypted: i=1; AJvYcCXqB3Y3hhYeTJxOo7T2HKFiqPqK37/Sy8KX9CTxaAV/xHWW6c5Cf5I1hlePcq/ZjtISyQfRPQooCP9ENQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ggNbXVuuRVVYNdXUJ5vQgYqD6rTa9uKXIWdVuAH0voxVnP6h
	dlr7AY7Qzbtn8uWSHV+Tew65bH5X/F9hzngH0m67aIuwmXtIrszfDbFlteBSXTSlo+tXRGw9Qtm
	wULN2SHMAQYne/cc1nH20YsjM0Vx/CXs=
X-Gm-Gg: ATEYQzxarCFX4Nd/RSUPBLPVMCRxFQ5bymucPmCDiZmpd4Ltuosw9QXhbqnP8XYVQMR
	v1pkV78MUxYLQ0I+0TKy+T1UHA0ZPSVaxO15rE9nX8Olj8aSbTM7HiXC5/fU+jtTU3X8Rdyxl7D
	hOqJG/5FmOS292fmgGzBoJjHL3yQ9W818wUOpRUOaQKixRmRA5GESiqHkEBjYI4HhrMKlEOR8kN
	0TWb8cA5HtQcKqjZ8mN/PB/12PdKrjI8+o8YjFSAlfgOvNYM9FA7ETggGAZ4QU0mk2PNHZy5OD0
	PNTo0RpuTT+xSi03Ew==
X-Received: by 2002:a17:90b:240e:b0:359:f69a:f7b7 with SMTP id
 98e67ed59e1d1-359f69b119emr762790a91.10.1773134968062; Tue, 10 Mar 2026
 02:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
 <20260309083530.2977163-3-shengjiu.wang@nxp.com> <9c7c407e-ced4-455a-a8a8-54b42f706130@sirena.org.uk>
In-Reply-To: <9c7c407e-ced4-455a-a8a8-54b42f706130@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 10 Mar 2026 17:29:13 +0800
X-Gm-Features: AaiRm51kpGDxVUwp306p9yXRCDiX0441GzksaY-s4uyolXBTtPbdws2JZvFrKBs
Message-ID: <CAA+D8AMOqTEPico+FYSd2Dqpux5GnhkMWc3dnJNXAsfGwV6VAw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] ASoC: fsl_sai: add bitcount and timestamp controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 6:42=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Mar 09, 2026 at 04:35:29PM +0800, Shengjiu Wang wrote:
>
> > +     SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_SAI_TTCTL, FSL_SAI=
_xTCTL_RTSC_SHIFT, 1, 0,
> > +                    fsl_asoc_get_volsw, fsl_asoc_put_volsw),
> > +     SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_SAI_TTCTL, FSL_S=
AI_xTCTL_RBC_SHIFT, 1, 0,
> > +                    fsl_asoc_get_volsw, fsl_asoc_put_volsw),
>
> Sorry, I should've spotted this on earlier review (though surely you
> will have seen this on running mixer-test?) but these fail:
>
> # # verdinwm8904.2 Transmit Timestamp Reset
> # # 0.2 Transmit Timestamp Reset is a writeable boolean but not a Switch
> # not ok 366 name.verdinwm8904.2
> # ok 367 write_default.verdinwm8904.2
> # # Spurious event generated for Transmit Timestamp Reset
>
> The reset controls should be volatile, always read zero and not generate
> events as a result.  The name needs fixing as well.

Thanks for your time.  Sorry I didn't know there is a mixer-test in
the kernel tool
folder, I misunderstood mixer-test was a tool designed by Toradex. I
found the tool
now.

I am running the test, and trying to fix the issue caused by this
patch set.  but I also
find some issues for other devices in fsl, which I will fix later.

Thank you again for this useful tool.

Best regards
Shengjiu Wang
