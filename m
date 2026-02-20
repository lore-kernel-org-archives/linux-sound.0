Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0633554F
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596386; cv=pass; b=imNAp+s1tbk32vOYi2vcPcNrjZa48KnjXjYpjlX9P26aNL+el1Y1rEZtkSwsYa6nVROOdJVTzDHXNaBbaQNeUWpRzTlC+YQiq+WB0PvOoOyNDR21+sddrRJmKlq/JIud1KiLtJ/AOwNAWpGcFoYf+diGbWtZXSEdSD/ppAA5Qh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596386; c=relaxed/simple;
	bh=QRaCONRc5hdaV5yD6G1ws4j28HOx/kIzkIfaOLPIQzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqgvDH0nJmBITn85ElDfUjx1nKwk6LyjSxc9UKP/zJm1VMV++HlvadD7Icruea5SasANy0cLYCw7X99I+P6j145F1nntL8If0QZpxMoapOeHdF5gaXtF46xx8TNlFxkBmPLLxgksX8yOk0D50Y+5/cSSBdTWIVhMhoPnzLbv2ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fE7sq6+7; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fE7sq6+7"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64937edbc9eso2021612d50.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 06:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771596384; cv=none;
        d=google.com; s=arc-20240605;
        b=RLCy3TueV7/ENj7fbTUGE3Kqi5OfFwHZa2caIphrG509/HH4MPIcN9lwWaQEKuGeNR
         ckDiMPuHvazAwMnsLClJYD1Zj0SV4wLo5r+WstHppdns2PGpNgUqd58e+ITSn+OHQ/6W
         kSx4hb+QAkYM7XUBEewmpiFJEu5H4l1hBnp0QQMs31U7X1W/Ng8o+isg+Q2+6wggP/nR
         lGDExhS+GGO5bfJmjSymw4y/QtMvVdKQ8LLtn29yOvDXV/T/WPHlVzmLcAXfONxEPsFK
         qQOdAG6ZzfRSVlQkZuan7HQdDkuTb+KXI3YpVyQVuS9ketMt4hqecdgSoQXLaVfLNdLJ
         RdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UOgAazGljr+ot4x0/70qWQLnH5bbSRlyxZpCa4QF8mA=;
        fh=ibqLfxMa4VarTg7MLeSoUYsRniTglauNDtciOHAAtJM=;
        b=fguRGVdGqodaGRf+QXNVEUGPaBaZfSFiAm27wUfeCP1V6k12vfjVrRyzTibGlWNTYD
         TvQADSjX9E49R2eSQLAsbQSCVZ8MUlWxoezHDvRagJ+FZokXbYJrS1C2y2wibp2nn6PR
         2UfO/0f9bPNpdlzCriGTAx1ppXXIyMZdxt2pbjI4ftR9vQMAnqHu/0siKCRt8/qitDkJ
         fJG+cgdA66wt3N0oDOpPP/KVeMaouiVLQTxqMF3E+XVYZPvA3FTt8OCGlMA3nzS9fgD0
         r9s8c1PjnuDTTvfLt7iW32xJ+UI0cD3m6SS0UV6O8OzZXgIF+2SmutqsFYwvWi59tkFC
         XCuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771596384; x=1772201184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOgAazGljr+ot4x0/70qWQLnH5bbSRlyxZpCa4QF8mA=;
        b=fE7sq6+7n/vZGu23M9dvburjHPuonzu6oq1/iW+uZ3eDSvK/5bS9+lV8UDBE3t9va9
         NzKaOgX3sTXlBjenjkQ953ToHpwfpFYa8ARUfHp2YLe4YaufPmKCI23brCOU01Guj1lR
         Y6qOzfBxQmdktAbHYpJ8KajakAJULEpihNELlmIfyuKdEuwlHVpojYTAI8c1ex2uG6DJ
         03SUwfdL+nu88eH/GrLhFnuFlPJwaLgZkwzYSPJUC2r08Lo5KbtLLPFjXDefKYCJcoJi
         /rql8tObUltBabzCb+d3/kiUoHf4eoqWQbk7zhhMX2otvKZ3VZ5xDoH7SXmZQKKnj2rR
         AvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596384; x=1772201184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOgAazGljr+ot4x0/70qWQLnH5bbSRlyxZpCa4QF8mA=;
        b=sHgF9eZbz81+fAwVJH44CiGPBzpDBu87e9kX2h5QQ5ifyFatvuycSRAyhvO3aYWU/5
         737iEpmz3h2Jo73yslG8Cs7oHYqXd+Py6cR0sQx7DJWFwKBWfX4XUJBDxlLxP9rfX1Os
         NI0MlD1IJh+PUwVLcDnRcktO5+gzvMFuBbGaygGb3+Umwn0jODyWlUZRlsUx/6qh1pGZ
         nCGLowMj4BadPtoxz4hPXHsEE0Ll+zWGbWgLaH8sGppjEWWReQUBoQ2iCJK7Srg2NtLm
         uAzfQEBS8m9yFh2pw4Zg2PhdYUYiug7ExVjaxjhYf/Ra21tAaWHFwFbJXBfZcHe5W3Gl
         hieQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj3UEHRA9W3w9Y7LCGwKeeC1CBO2NiegmeIE+UU+h3XA4bpvxNVF2wOCJlyDWNEP4iOCwehnZfDO6HaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5K0voni+VSDqGIHemFhIaUfA58gQvjKWwcBU7JAmICIvyduK
	kfF4Tx8z4XYJpOW80iPuxJqKtdUAO0oOntKmDpagZh2msBxgIqgUXC4zD8ZRdKmn955UPSfbaME
	IQKFn6R7RIy6z9idhwKq8zL77vjyf+Zb57kwANAvjDQ==
X-Gm-Gg: AZuq6aLQ51JFz7glb2MoIaPm+z6nFOuYsiQ1iuEHazK/xarR3TGxBWKcougkLRT/UCk
	5Au8bN4B2KhnHfx2YsP4GnNsAjqqXV/iRD57Vsohm8XNbyjv0CPC+R7Xs7+GORpc0tw1XNl+36F
	zSHcnkb/mbmsyoS9pyHq/URg0xKlPIk9x3UCQJD+yq7LiHSh4E8Akpv5Fx3/Rj5Ap3hyqp6apsB
	qLnBI+lQxuDQN9hGL6Lw9K9TWklNdncSPVkS5SIA11QJ/0BZbA/86QKo5sBU4tPADLeeqvFFBMo
	m/5QiZ6iXtmvujjV6UoMy3oOB+gIWcbBZGYj3U+bTKhhlrlnADwaAS0pvTrk/mRlNSzNIvmv4N0
	r1X4M2Fa4wWguhukMHLKnb5Lx4pKPxHjkY5rP
X-Received: by 2002:a05:690e:dc6:b0:64a:ea66:bb2a with SMTP id
 956f58d0204a3-64c21a68e0bmr17293799d50.21.1771596384461; Fri, 20 Feb 2026
 06:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com> <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
In-Reply-To: <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Feb 2026 14:06:25 +0000
X-Gm-Features: AZwV_Qgk2erDViJ_8BJxfIIzRd6Ulo2V3D2EYpqI2bpv3wyflTdm2QSyvgXPDbQ
Message-ID: <CANgGJDri==VUhMKhEeDYs5tmkcGcOBHbzMT3U314bxK79z4mTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Luca Weiss <luca.weiss@fairphone.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, 
	srini@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Feb 2026 at 13:34, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Srinivas,
>
> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
> > Number of input and output ports can be dynamically read from the
> > controller registers, getting this value from Device Tree is redundant
> > and potentially lead to bugs.
> >
> > Remove the code parsing this property along with marking this as
> > deprecated in device tree bindings.
>
> Could you help suggest how to correct kodiak.dtsi?
>
> I'm seeing these warnings on QCM6490:
>
> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch with controller (1)
> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch with controller (6)
> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch with controller (4)

Such messages were present on other platforms too, this is not only
Kodiak. IIRC on sm8550 and maybe on other little SoCs like on qrb2210.
It would be good to have something that will work for all platforms.

Best regards,
Alexey
