Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DB2D94AF
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125398; cv=pass; b=TAGU05kUMLFGkLe7CzE4II9HbzVYu0789vivsCkG16kTetcUEq07qaVMOVsGJ98qRVBEZJQTRcTkru50sUborTxFM5YJ0qNQ55wMYSMCRF34RCWM8W7hHR/+QjtFkvpvTE3gclLgrAlqVfNXJjvDwwTFwESSOkcI2hsjHXgrGyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125398; c=relaxed/simple;
	bh=ebaYgffeHYn7gzwVrIV2yDgbyv8PU9o4IV7Dp2Fxs/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpOS6qvpF+B6z+/damU971IqpDkDVg3kit1EcuYiifZJWBfs4KlLD4+2x2fwmxv2nAO53On/1vzEIhAMlcVyt3Eq2pU4JhCItzYLqbXPAMaNeF++t9wd3LxxrU+S9MILltrEByRgghdpfN/0uSPcK3Mc+sIBJAE+retT2kX/GIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap4UnsQM; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap4UnsQM"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5663724e4daso3849938e0c.3
        for <linux-sound@vger.kernel.org>; Tue, 03 Feb 2026 05:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770125396; cv=none;
        d=google.com; s=arc-20240605;
        b=XZ+7Z2N4ZiQceGNlCjF6kVs9DpapWIlM/XTO1W83FIfUPJCK/krNE/ErudUBl5jEfo
         +YkU0qPuChZX6JVo6tQA3ztkjaTBQXkP7ztuMkeDOAK8tJzSKI2GZdFRrzsSuIOkAXy/
         4eJU6pp6rHdjcA4arUDnk70NVbSkRpRjadx2Robi07cnNkjJldR3w2orUzenxJlWK5dj
         dvoJECdENhjRNVmvOFwLusc2JOoS3bvVlwCq9FnJ9Si9mF6XZjfrrWJBEAtB9z3NVwLy
         lJ4wkHSRQoE55E0guliggxFyRZN8TuI0PBZ0CLp1mnLdJJjTeDOl7QmlpDtkB0Y3bjLy
         gRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/hci2sdsPCD9iRXbhf00hUDFJW8K56ypEr3d1bbtrDk=;
        fh=1PKfNBuGm8494ojKg1AsJw3ZFFA8FbuDsB8IYtqXFZo=;
        b=iuPMPicBpOCr21qvI6y0fA+sjub2Z/KtObldmIcCYn/kaDjgIhanZivRR7I/Pnwpa0
         aYfUPFcEPG1RAhojaL9TTJffsIJ+BKReBuvFD9GCswW54R4mhHw8t50AEbTpuXT9s8TO
         F0Xib8xWfoTHWGCoZcFURLH68dRnLL05Rt+iNgjNs2BX2ljeWUF+19ZzVXu9PM0Ql+wu
         hvJ44vU197lu163W40+5IpTsRJLuGwRwSyysZ0zeM/u3TwryuVwYiy1nc2Au3fzyFGxo
         hxDCwJRdKSg7KC8jRQWroJoBT18AEC66eiQHeLNTcMKpcPLxri/XvWh5suTaQHQQEd7C
         zkUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770125396; x=1770730196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hci2sdsPCD9iRXbhf00hUDFJW8K56ypEr3d1bbtrDk=;
        b=Ap4UnsQMtB4QlvY86JDC+bIIqrdCsnFMyE29yKFcXCHBKlVYOhXoQoI8LErpTSzZ1u
         HpMiBaruBb1fmCTY0DZF0+IffN4qWtjebKigbaRV5kfs/2ZxOY5ZPhJabjqX16l97VnS
         LiB2L57ODTs5pA9cy9AabITyOtpZ2X5GUCDw7f9QiuE3MGuGdgr/7aEuLaWm5eqn7xa1
         bRPZ3qL6j4Fd15rkN2WB/qbfkmq1nYviInZE+IXEt4tt61Gp2W+wy/SpOxlKpjyDYjUs
         LKLPXPtvOmkX7qRQLYYV9N9N4C2s/RhF8oTiapeztHXcN9qH52ezVrAfaeyhxW7YdO3F
         U6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770125396; x=1770730196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/hci2sdsPCD9iRXbhf00hUDFJW8K56ypEr3d1bbtrDk=;
        b=YqNYK2bAYWwBhPSUXacdCu0UcXdqKSI/OVFot5qJVDj7JBx06SGW2AO4AtU5pZ3X13
         vBc5Oz0EINOu1rnk317B2IwYUTevcHSbzlQ9QMwCfX0j4cNPXurzJTiHur/ksFRmDNJJ
         ii+RYZ9bc0Qtwo1+AL8iSX3y8km1BrMm2ab+B/bnYbY6fm0FDbfYSRNNuthp2okHC/rQ
         9Zqql8cFAwA84tmZAtbER/N8iMJqRG2g3BSPMwSkHf/kRVHc2RYqVcLD35S1J1XMt4fw
         hGsKl4Rrsqunxzwz/Ue9FI/EKyivaHrgCK+VOIOXHlVmqivTCbldXURprGONzUjh44ji
         EyFw==
X-Forwarded-Encrypted: i=1; AJvYcCWaYPRWA1pJ1lATB6/LPtdYiWGU8tblCYaWzWcccituxJsuRCgAOBRtWCQLxOwjPjYOI5XEmcf/gMD2vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZjoIS+mniPZF/ApBzO26ijeOc04XoV5kxKUSfGibAhMXznLRm
	pDc/QsgQastV7W8qmi4ql7WqAuNraDCzhwp4lXk08x++828lzHBHi6Ua5It8z3m04z0A+K8AeP/
	WYKk6xPQW/A5O/s2CdM0mOmYzOwh9IBPNDU4I
X-Gm-Gg: AZuq6aJBQrd8vC6MDsQiS/Irn6rEe3rBzpg2dyF2ySAnglUpy1ZHRitmNfNJglfJqWi
	srJeIKs0B9amCtVpDc9NtzSDTnvvlh7KxtGQeSiQ1de45tAPjwNOk3BaqLWxCyDBqFVpig+Nd8y
	2X4V/QDrh/cD4qXN0Vg48+igeiaQ+1o1R3RYH8EX8vorexDcWQksMKJUbaPMfQHjo6XQ60JLY+i
	iKGOS8dasy+mh1dLhck3nSg8zze1nGoNYsdv4RRXlJ13bzaSoMqBCQo3L2F2LwWjm6ybkM52r0y
	IJI0AJdr0z0G/0pcL+aSVeIAIUh1cillekdNNntkAMl4vMwfDjbmGfLkGKzPHfrJImkmU8tOPcF
	Foaol70yEtA==
X-Received: by 2002:a05:7022:6b99:b0:11f:3483:bbb0 with SMTP id
 a92af1059eb24-125c0f984d6mr7727526c88.19.1770125093214; Tue, 03 Feb 2026
 05:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202205758.3044617-1-Frank.Li@nxp.com>
In-Reply-To: <20260202205758.3044617-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 15:27:39 +0200
X-Gm-Features: AZwV_Qj2z7qbutwvB-NPA1F-KcZIWGH03UnT5CBo6gdKULcm6QEzcKu28K1kX_8
Message-ID: <CAEnQRZCrCEa9TixELqZGngXL=TrWO1i=m7dqgLtcx_pN+wEaWg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: ti,tlv320aic3x: Add compatible
 string ti,tlv320aic23
To: Frank Li <Frank.Li@nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jai Luthra <jai.luthra@linux.dev>, 
	"open list:TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS" <linux-sound@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 10:59=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string ti,tlv320aic23 to fix below CHECK_DTB warning:
> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb:
>     /soc/bus@43f00000/i2c@43f80000/codec@1a: failed to match any schema w=
ith compatible: ['ti,tlv320aic23']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

For the next patches I wouldn't focus on explaining that the patch "fixes
a warning" but instead on adding an undocumented compatible string.

The CHECK_DTB is just a tool that reports the issue which you can
mention at the end.
