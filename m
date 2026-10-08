Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5500451991
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449212; cv=pass; b=qBhxhr3hI7y+o7kmyuIrB3m3h1NsA0Ukgj9B+MmHJFfB9Tb2ImHByD5ecGOtz9u4PF9tSRmD0wTL5YiwZmY93IFED150Ns/YwAKPW1O/rp6oseUmsvzh6UvLG/xXETRIytiX5JkbSfiqdnzVBjZ/vsa3FUXBPjp5+O2nGapzydg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449212; c=relaxed/simple;
	bh=wnGY+XHH6HDJ4wz0G2ps9VHtwY0746+c1EU1QVcGcMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qx/GIlydGT0/s2l/Iuq0LV4digk+7HnE8KWsVfF4Au4NjCqHba/4vKEymC4NfeUOOUgQsS7nIl0dHV+Y89xxymnPjQxhhBOqThNEuo0G/eHcAlrniM4PqCAZ8JHhssEZfZGL9EuPVI6OR7CfjyTtb63QVoBH64giYOTdy7f8Wqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YN5vNcFH; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YN5vNcFH"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82621039b6bso2844275a34.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791449209; cv=none;
        d=google.com; s=arc-20260327;
        b=KimIid+puSW1C0OSQLMkRyvgFv+3TdttQNEckjWuVctL8ImOx7G90TAGOQ8uFffcBo
         mhD6dxv7FM/vn3OSFt+C98LHsK0tdU9I9N7Vu53RiM+cj6fWjdqNezUjEzwYKIWLQ5WH
         H5qDLdhE9YU39uT3gMlPF3WcbzQTb3eVDgaDpCbkTPnbWFqT9dCnE11/AGgptoS5rJV/
         AwgEv11R01xf+RceBZfy57n7fB4OYKQve+ZSA6N2xgEiSPhR0OlRL0b9CIEbdJM8F9Q9
         p2Y245L1LnawquBGWTW3uh5b+Q4KDEk6uTuZL1HS6fhxdqcFYVj1JnQaeQp7vSopdKXz
         +kvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        fh=XmTGXIqrPXfjbl8cBTb9HGuZ/zAMBPx89CQEzWaq+Hw=;
        b=luwMbkTW5/B4NoSg1B+U2L8CzYRW1AfC4NnNg6CWIrREYf/kmqyVwbsytsnc0LGEn9
         UJVZ5YYu6NyllpGRQjMlyy96JoFP9F4zOdGdVdt6dp6S1dU7Et0DKRTttNCmre9TnRuq
         1iANMVHs0Szrk5+5iOwKpIr2qysLjoqNgf8r0uWRueklBxYHQ0Yp3M5KPUivrP3V26S4
         W5pArbczfgAlECMZbADi0wvLr3x6Z1cmGcGlZDBUb0+aLJcluylrk1knpXkdDaBXSxik
         zVYn1EBmKLr0SKO/cI6AxZrHAp99POXL6quqqzDuPuy/oviwpl3/vTfNdSXKeQ9/22OS
         Ujag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449209; x=1792054009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=YN5vNcFHN6IYyr86NzMr24Ebg3iUFLvJ54CzyveA3G5SeVCYuUKGNYTvbV+yQr1d1W
         oM0NM4r7IrvcwGAj3Mg5udBIgVygQ9g3OmJK7PXtP94IyusoXNVaX86R9xFQQX384iSg
         rdj7kWkisR8fDl3OVCq1YaQteAhLddcwSJkddwDSv0csvpNN+An7Ln9PrBOO6KRLrkLB
         YXiGZ6zR1Xqi7ortkzrvOVDogcUf6Uw+2GM/MFr2QnnC7RB16K2kqaTA/91L1VH5aLM0
         3hA4evbnop4fBkDfzGIRbRVvHl42LXVAb5fyC9AKc+7HfvZ7+S8w/uAxoJC6AOzv9usI
         /pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449209; x=1792054009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=G+wzC0uwqcPhxZhh7I4GCj7K1It4N+LPGQN31wTDi8vX6prrkdCNpqfDcdw1SR+Sg/
         ly9M72gzWSdD1TJQ1MOKojvV5ZDoPlZ7KoU/VQILIp1O5vzIut+1XJOohy50yoxY0Uq0
         5NliCWtrznroSZIGPpuqvz+4r8kauZtUMrT9pVnqt+olRLR8aIDSdlppHYUamOHfWHdn
         7dT1wvcltPg28x4ynv5SZS2Kdag4v6MXKcuLOxXIB5QXLI7trtp15Y+AKa+ocqGl2fnB
         7CgbCAJ2xRpz5voY/TC5iSxRxMq3Y4ny4uQ3XHYdl0fgDPtyKzhwJr6g60Mir92QI7sc
         QOeg==
X-Forwarded-Encrypted: i=1; AKwUvBw1sOj0md5rBk88mPnZSLrE7cobG7iPigkp5IzqNHhF21x1UKbYDKJRJpJIZHyggX59atQCtBcwjr4hdw==@vger.kernel.org
X-Gm-Message-State: AFuF++mNakRhI8rtxxm8xfMDOiU/L4EXU5WXXTxwaHTTgHRWIt53g5kE
	yF9IIpXc5pxzuJlHrevlrtI00hSgnzl7zO1cljlWEl2/eQJu9TATEZ3sZk0ieKSTWur/s3q7c1n
	RFQRvFTfxkvJEHuHJir6HgLWUJ/9n2MM=
X-Gm-Gg: AYBFou3zHytcfPVhrQEzGwDZ7hgizRt85hSOwDDMFnriihuP3NwqQ9pkO8RKwHrGxbH
	JE5jEVJYGdM/Y4dzkYK4ETNfc9qrYp6/FNwTZaj7AubFktMHu92JUarahLCWRhmxSqZzofYM6jT
	jd+WqN7ce6eTrCHwDT+hTktICXNqblqV/tKk9gTsiiTu3vjeciEw5jxNDwAjeUQiF37Ek97Os4M
	lk3Spdiq6QjDO/dXkj0oPWkOXmyk5JOZWWTZPd63yfJXrtZ1pQ2QUS3T6Ia0KI8+dXkP6qwVq/w
	BSck/VRspUI9sRs73kuQxS4QZLrqrswW+UzjvfnlC5oZmZou5+Na7EjUiO2bHemEICL24V2nh1e
	pWE5qtks0uIxLwkLgLq5X99zaYuhhvOe3MAwdGwZByc1IiL0k1GSHWzVSR0gQ2vKUzhJfAPTM3M
	5qj5cXp9JQTZ7eebb2GA0OHSeiXmMyMnj0aqAo1Vgz2SFtwM8yqTk=
X-Received: by 2002:a05:6808:2e43:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-4fc46c92bc4mr4767586b6e.58.1791449209535; Thu, 08 Oct 2026
 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com> <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
In-Reply-To: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 8 Oct 2026 18:46:37 +1000
X-Gm-Features: AclHuK9CHquST79ZWASmiEF-eCVAGlz1SqIt2DEtZen9lPzYSl_ASrQBijUe-o4
Message-ID: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:33=E2=80=AFAM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:
>
>
>
> On 10/4/2026 11:33 AM, James Calligeros wrote:
> > +&i2c3 {
> > +     status =3D "okay";
> > +
> > +     speaker_right: codec@34 {
> > +             compatible =3D "ti,tas5770l";
> > +             reg =3D <0x34>;
> > +             interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_L=
OW>;
> > +             shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> > +             #sound-dai-cells =3D <0>;
>
> Both speaker codec nodes reference the same shutdown GPIO. Is that
> intentional for this board?
>
> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
> GPIO requests are exclusive by default. So I would expect only one codec
> instance to own this line, while the other appears to fall back to the
> register-only path after the GPIO request fails.
>
> If GPIO181 is a shared physical shutdown line for both amps, how is the
> power/reset ordering expected to work across probe, suspend, and resume
> when only one of the two codec driver instances controls that line?

We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.

[1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e1=
8ce@gmail.com/
