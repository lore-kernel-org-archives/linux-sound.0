Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C6B325704
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897767; cv=pass; b=hPcZpWSlxAhAxnFCgJcu69Xv0FLyVbx0iZikB7uVxbYHVBnxzrvuouXxbH2BA4JuDULWNfxNmlRktdWve4/5VHuwuszxSYAEUZsBJcagl8Ab6MS3Lx8RyaT9CEK0f1U9GMCvx3JW7Vhb8H0nAYzrWTTA1v0jaxd5woC4orJZSOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897767; c=relaxed/simple;
	bh=tB5UvVyyaW69TUSaiIcWww9fyaZgzM+cWqkdUMUA8D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsEGiJjmxxkNnqBY+yCDOPUJpTVDUM5q3JxgmE0FdUbA6gyPiWkuwqZ2OoN5oCsaumg2fDULZt2tS0wOCFtpbFZym5A7zh69s3RFyLT8QVuCOB3frqxtFXpci9WetwiDwQzrwgup+pfmqhPASrZTjKGDLdeXjcx9FOQGGHd4vsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQOGhrm3; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQOGhrm3"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3114153e87.2
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 12:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897763; cv=none;
        d=google.com; s=arc-20240605;
        b=WAMNkgDDyRqJg5X4d/3a1Qoby2uB0CbgTYO2LPLecoSyzBUl+cRhVYSA0kB1Ba5ct0
         eQFBSx9+poIAu4z0TqPpBweIFPO5H3AB+mTXzwE/9r+9omMf+h0TS5er1VIZU1KMaTot
         upX7BnTeQ5Xs4Yb8UZw6oZJShsx4t+R+IgrvA44X+DdLXwHhi6RnkDzyfgSEYmS/WLRH
         JCkiDlj0eoDpc1S8uuPhOICtOeFEDwJ/FpIV6zJPYwozIDPeApT3AbANZMj6udGTky1K
         gg20xNn4IsdKPs0CrXtcUUkXiqGxyx0STYW95MhlLLGQNcff5EIRC6hzpH/3U/ue5dEu
         lL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncDn/XtFsN7SCJcACGkW9Af70bOhZca63Df9xP3DVOk=;
        fh=YWeTV2CZL4r23wYl3P8pZtKNxcGnJtZ+1ulLaGuY/iQ=;
        b=iXJwgiRfC+iIpMrc2PNqG9mWIxhtDVXrCGc08kWLRbOP739L1KgbeWOmYO1JoP6oPN
         Of/Ms2482PotZKemRocuQ5GQQOtdvkSiQX0VZ6LR/7hHbAI+dkWHeSlrkXGOZvMVvFRn
         wG96xX8a9Otd844VRfqxl8Jk/F53ujwaoXzL+BaU1aH+PkyjY4znV8PYaFZmvHI8w5QU
         Aqx79lhWzGZ35AYHWojGqHfWo2WRM1n52ksHxwhJEE13HSriEtncMz4sxkD1Zr/iDAvq
         bPRAIPq1Nbqs7HTW+H9YPVeB1f7YggDTF7qOmUGh82Avu31TUjtDLKpQ0D+ei3zTyqDw
         vcVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774897763; x=1775502563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncDn/XtFsN7SCJcACGkW9Af70bOhZca63Df9xP3DVOk=;
        b=sQOGhrm3oLWEwGZK09EbqIiO4L5DYmtsOONAIoW+dg06/IZjdiW56Wi93t4EFxmLWV
         T9hgNwuOQF7922eQUGK1A8g0rD9HBpd+T14CLdnhc2TevfBtIrINTDDbh4pezY6UrCLT
         G220r2td0n63/4c9S7YRcso6+hTgpOFVK4NhW6LzOXz00cwsXpvx5hP1FOiwQAPIhWzI
         NQtnyTVdAkxjQMVIvUVbgbJwHSCWwtieTuhlliAXk/u7sVAcc4TbbE5Y5N7uHVs+lC14
         11nLR9RjHe7qgOp8dvLhV9znxiTALj+K6vfAXm1bx7c9JLMuTuL50YjxvnceybTnG27N
         ukAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897763; x=1775502563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncDn/XtFsN7SCJcACGkW9Af70bOhZca63Df9xP3DVOk=;
        b=EdrE4/9L1Qq00ozP4CJN+Q0c1mExlzqlVBCsPItjHgw2bngrNomIYnPNj3WY5+Nyo1
         PvEoKFVU2CDx3k1YG+K8S0Ivi7rv+s4v5AAb6lungOlSw56hYKBMCI061OLLSkIH7mLW
         5xZTBmaVXcVlxw9gaogQ1KYiFu/LoOHrN2qFWmNufmOX+c0ttQsLGPnYM4LPiY8nxBqB
         Cfv/GHa7lMvmna0Rke1gvx9JMbGwj4oUkrTIKQSsIFOYILj7g6amfCXz0WnIquE1lMJZ
         iCr8u/Qp3YN0SGicc+u2qs1et0x7xLWFGzaqze/jC+4gWYSOuS/z1F4KlYvx3ry0AixJ
         jhHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRjEiL9XDB/HHPG4gSmXKp7X6xaLj+YjndfMgxZec7KhkjjLbaLQQvqRcRiP+nBemqA7GwtYfjYspxLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+gxoH8/haYMor6LWqYL269TPdQF5uX8EfgCQHF39OCZ2n0RX
	FIQeBCv9VolV0y+DJGF/wLYWPjtggAd1s5wLygjOoz81DNUPU0wsAHHOPRRLhRVlN/uyv+i0tlw
	XZ5Um5mAYHWb4HsZ0+NWDO03xKG0BJeU=
X-Gm-Gg: ATEYQzxLDuY8RMxBYTG1DlWroEbMut7J/VF1thyTPEEB1LQOx/cHqdvgztZ1fsSkRJn
	UY6q/I9CRBrnCXfXq3vJJ1nph9pHPTgc59DXO3rt4tppJakIQQPzFD3f0bdad6z4GU2Zx2fshSO
	br+cAwXWDvrH0sb1ToOhmW4iqAEtafxqWYWhbStGVPdlwAOekqf0kYJgYjFj8spzMuuyOTBmDfg
	Gj7Ot6yHnLb9bscLkEuZ02cncHYEAgvc2SyUHQmowIckNq3ElAc0xLjoX+J5YIVPj8+PlPpg3FG
	TxOLvzF6X58coKu3Q97SQNxudIebqN0ILzZH6HpU
X-Received: by 2002:a05:6512:2252:b0:5a1:3bd2:7330 with SMTP id
 2adb3069b0e04-5a2ab7e973dmr4325669e87.2.1774897762975; Mon, 30 Mar 2026
 12:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260328-hidden-secret-oriole-4dddb0@quoll> <CAEjBr-aoOhbtZWdYvq3rQ3q+2SKUEctTXPdYcoS4mJyrPf-Yqw@mail.gmail.com>
In-Reply-To: <CAEjBr-aoOhbtZWdYvq3rQ3q+2SKUEctTXPdYcoS4mJyrPf-Yqw@mail.gmail.com>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 31 Mar 2026 00:39:10 +0530
X-Gm-Features: AQROBzCe-fvcq-uuVF6744K-oAtwxP-D31BDOlh2wjZ0d72FF1zcLp7Eh6-lIYc
Message-ID: <CAEjBr-ZKhrh3-C+xYLamQ-+ukg12u8McWj+MbUp4QnuOUvRi8g@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: k.marinushkin@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 12:28=E2=80=AFAM Padmashree S S
<padmashreess2006@gmail.com> wrote:
>
>
>
> On Sat, Mar 28, 2026 at 7:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>>
>> On Fri, Mar 27, 2026 at 05:49:18PM +0530, Padmashree S S wrote:
>> > Convert pcm3060 to DT Schema
>> >
>> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
>> > ---
>> >  .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>> >  .../devicetree/bindings/sound/pcm3060.yaml    | 42 ++++++++++++++++++=
+
>>
>> You sent it already after I asked you to slow down and implement
>> previous feedback, so this has the same issues.
>>
>> Please run scripts/checkpatch.pl on the patches and fix reported
>> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
>> patches and (probably) fix more warnings. Some warnings can be ignored,
>> especially from --strict run, but the code here looks like it needs a
>> fix. Feel free to get in touch if the warning is not clear.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pa=
tches.html#i-for-patch-submitters
>>
>> >  2 files changed, 42 insertions(+), 23 deletions(-)
>> >  delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.tx=
t
>> >  create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.ya=
ml
>>
>> Filename must match compatible.
>>
>> ...
>>
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  ti,out-single-ended:
>> > +    type: boolean
>> > +    description: |
>>
>> Drop |
>>
>> > +      If present, the output is single-ended.
>> > +      If absent, the output is differential.
>> > +
>> > +required:
>> > +  - compatible
>> > +  - reg
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    i2c {
>> > +      #address-cells =3D <1>;
>> > +      #size-cells =3D <0>;
>> > +
>> > +      pcm3060: audio-codec@46 {
>>
>> Drop unused label.
>>
>> Best regards,
>> Krzysztof
>> Thanks for the review.
>> I will run checkpatch.pl, address the comments and send an updated versi=
on.
