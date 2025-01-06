Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C5A2BD10;
	Mon,  6 Jan 2025 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736167798; cv=none; b=fzeBgtw9fi9+K3+ydQBR0V1gN8Ws/P6AZyDTgioxtntFvXuEAHDM7XqBJgPF35nW8Xm796Q30ZkP3PR21Ls+QilDtkpXTwqOydjXQbbflTpjejg2cVo41DJNAfv1c8i0eM5KZGqyuYL2JG2t5G3gBV7ttUn+L6kjnzI03V9wW7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736167798; c=relaxed/simple;
	bh=qm7ZdXrUOTp8/w8z0G0p6yf1xANERLsjmrHCBTYXQrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pS/J0jNTbAeFjjGRyg9PhKn4jJGSrhnuNYVNm7AzhOQCCnv4yP/DuzPY8K4Rvu8NksbuEV7rqkVvrD6acQIAZE65QMnL7j2X1bQKmpUSacbTmQtg0qO1Y5/1NxuBB7cQ0efh9KadMqCQbZntXnX+qpHKXtCz0XUgj3nY/LN3MxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ui7y6tN4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ui7y6tN4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21661be2c2dso186519725ad.1;
        Mon, 06 Jan 2025 04:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736167796; x=1736772596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNEZk5ddA3ly0m7I4Ts+PZ2QcYJquoLTFQCrFxQhjcE=;
        b=Ui7y6tN4ZfiO6fpOx7PnOu+0heOb+93P+hrbU/mYzvF8cYYg+ljjmYHhmQ6rT6hY2Z
         J9Sr5rVlWbTypcHjxWy2HsiZkKcyFxbghWOQcZAfnvhm7Jte7lpML2bsHYuFk9kE8zOE
         vRuwF81KZoXJwRvc11wpuCdXDzH5ycu+N2lw9e6/EHH1+9m6W5jyEf7SliE7BCq6PFkl
         6hhpKPvLjxLOBnlAzBUycFcfE5+l3OmCa9lqtDc9kr7CS7xti4ZCgHqBOGbuMm3az+Di
         UVVwhIkda6sVM+oAUzsO+r/Sw97A/cIyAlAvZbfK47LnP8ZvVPRdgD8Z8ibv1BnChVtV
         KQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736167796; x=1736772596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNEZk5ddA3ly0m7I4Ts+PZ2QcYJquoLTFQCrFxQhjcE=;
        b=MOUJiANEpsaH8sdOWdyEjbet0RctRNQdFIqmOtDt6DJMOZu04BXpC99ZYnw1sKgYEu
         AswC1TdI8ucNYYnxKc00Ao0bJgjNcnxIcH+YrRkF/6sHAtq1olwZdQuv2DAPf8Y5yiIN
         0QRCXxzyels7e/FMjK33I6cx8GTdVPs2TEdh/hEa9+IcjAdX00mCcgKJkCidyb070ncR
         Anwzq6xw21JqVYOknnXtJ3T/x5CsORPzwTFvZ4TpflFITS2yq8Zvjy9bqo9C3GraFkD+
         i9WOnYSJl59NavlhErowvmvVSc2bKwvFA0bbo/XBP5a5sc64W9scgwuulP2NSe9Gdnw4
         9d6A==
X-Forwarded-Encrypted: i=1; AJvYcCU8kJFeRKH19nXsTQ+wY6CRXu3E8VLT1xh8Hf+2aPs3I7AfWsggupPErZrSFbhySZnI7H8+K7lzLigxHho=@vger.kernel.org, AJvYcCWAm8S+WMKcn7W11QSrbGP7q0yOCcoj7LJ+aJtlYKwmzBYh2i+65CknBraCvERD3KB8HKTDqqaOumIHseI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTEMwvMx+ZM4NzgIPt4nab7Ycs9RlLBQza0aKTx3P9Xr3fIuy
	LJAc1cyYJkfIofUOqqSf1FJWXqzqWrmrRWFdkn9ToyYns0RaV8ByR5dGQqErJNTLsVg9nqxJfEk
	bua7QEuFO6ZwLrMwL33qJUh9F9Q/ceiPw
X-Gm-Gg: ASbGncu+Qb9+fT2hEtAFKxhvJaDxPB7KXOXpJ9Z5Ld9fghRyEskJH5IrBJkdEmR0EbK
	pbzDb6MIBWVY1eCuWeIE7cl1+PM8zh2IVwQ93LiZnQb+jF+3GNQwK
X-Google-Smtp-Source: AGHT+IEiBsuTS3ff1IHORBHdNPZnr464pawYcL5M4FmA7wQd0hDWTnZA/P5tSzmClXti0ljt5D65N86rEgJnLxZ2pCs=
X-Received: by 2002:a17:902:ef08:b0:20b:6d82:acb with SMTP id
 d9443c01a7336-219e6e9f521mr786531895ad.23.1736167795584; Mon, 06 Jan 2025
 04:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 13:49:44 +0100
Message-ID: <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: multipart/mixed; boundary="000000000000ba0f07062b09103d"

--000000000000ba0f07062b09103d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
[...]
> > I have further verified that the gx-card parsing does find the HDMi
> > controller and links it correctly.
> > To me it's odd that only the .prepare() callback is not called, all
> > others (as mentioned above: .hw_params, .startup, ...) are working
> > fine.
>
> I think the problem you are seeing comes from the quirk of
> codec-to-codec links. The hdmi codec link is such a link on Amlogic
> because further digital routing is required after the backend.
>
> Those type of links are not used much beside some
> CPU offloading on Samsung and Amlogic, as far as I know.
> It is possible, even likely, that things are still missing there.
>
> So those C2C links are operated by the DAPM events, not the regualar
> ASoC code. You can start here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
ound/soc/soc-dapm.c#n3995
Thank you - that is indeed the root cause!

> You'll see that .prepare() is not called, same as .trigger()
> That should propably be fixed :/
Since I'm still very much clueless about all of this I just came up
with an experimental patch. Any feedback on it is welcome (I can send
it as RFC patch - but prepare for me needing support).
With the attached patch I now see hdmi-codec's .prepare callback being call=
ed:
$ speaker-test -c2

speaker-test 1.2.13

Playback device is default
Stream parameters are 48000Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 128 to 262144
Period size range from 64 to 131072
Periods =3D 4
[   42.043413] hdmi-audio-codec hdmi-audio-codec.0.auto:
hdmi_codec_hw_params() width 16 rate 48000 channels 2
[   42.047916] hdmi-audio-codec hdmi-audio-codec.0.auto:
hdmi_codec_prepare() width 16 rate 48000 channels 2



Best regards,
Martin

--000000000000ba0f07062b09103d
Content-Type: text/x-patch; charset="US-ASCII"; name="soc-damp-call-prepare.diff"
Content-Disposition: attachment; filename="soc-damp-call-prepare.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m5l1ck5a0>
X-Attachment-Id: f_m5l1ck5a0

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvc29jLWRhaS5oIGIvaW5jbHVkZS9zb3VuZC9zb2Mt
ZGFpLmgKaW5kZXggYWFiNTdjMTlmNjJiLi5hMTE1MDE3NTI2MzcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvc291bmQvc29jLWRhaS5oCisrKyBiL2luY2x1ZGUvc291bmQvc29jLWRhaS5oCkBAIC0xOTMs
NiArMTkzLDkgQEAgaW50IHNuZF9zb2NfZGFpX3NldF9jaGFubmVsX21hcChzdHJ1Y3Qgc25kX3Nv
Y19kYWkgKmRhaSwKIAogaW50IHNuZF9zb2NfZGFpX3NldF90cmlzdGF0ZShzdHJ1Y3Qgc25kX3Nv
Y19kYWkgKmRhaSwgaW50IHRyaXN0YXRlKTsKIAoraW50IHNuZF9zb2NfZGFpX3ByZXBhcmUoc3Ry
dWN0IHNuZF9zb2NfZGFpICpkYWksCisJCQlzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0
cmVhbSk7CisKIC8qIERpZ2l0YWwgQXVkaW8gSW50ZXJmYWNlIG11dGUgKi8KIGludCBzbmRfc29j
X2RhaV9kaWdpdGFsX211dGUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBtdXRlLAogCQkJ
ICAgICBpbnQgZGlyZWN0aW9uKTsKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtZGFpLmMgYi9z
b3VuZC9zb2Mvc29jLWRhaS5jCmluZGV4IDM0YmExYTkzYTRjOS4uOGU4MTc4M2U1YmU5IDEwMDY0
NAotLS0gYS9zb3VuZC9zb2Mvc29jLWRhaS5jCisrKyBiL3NvdW5kL3NvYy9zb2MtZGFpLmMKQEAg
LTM2MCw2ICszNjAsMTggQEAgaW50IHNuZF9zb2NfZGFpX3NldF90cmlzdGF0ZShzdHJ1Y3Qgc25k
X3NvY19kYWkgKmRhaSwgaW50IHRyaXN0YXRlKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoc25kX3Nv
Y19kYWlfc2V0X3RyaXN0YXRlKTsKIAoraW50IHNuZF9zb2NfZGFpX3ByZXBhcmUoc3RydWN0IHNu
ZF9zb2NfZGFpICpkYWksCisJCQlzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSkK
K3sKKwlpbnQgcmV0ID0gMDsKKworCWlmIChkYWktPmRyaXZlci0+b3BzICYmCisJICAgIGRhaS0+
ZHJpdmVyLT5vcHMtPnByZXBhcmUpCisJCXJldCA9IGRhaS0+ZHJpdmVyLT5vcHMtPnByZXBhcmUo
c3Vic3RyZWFtLCBkYWkpOworCisJcmV0dXJuIHNvY19kYWlfcmV0KGRhaSwgcmV0KTsKK30KKwog
LyoqCiAgKiBzbmRfc29jX2RhaV9kaWdpdGFsX211dGUgLSBjb25maWd1cmUgREFJIHN5c3RlbSBv
ciBtYXN0ZXIgY2xvY2suCiAgKiBAZGFpOiBEQUkKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2Mt
ZGFwbS5jIGIvc291bmQvc29jL3NvYy1kYXBtLmMKaW5kZXggOTk1MjFjNzg0YTliLi5hYzhlZWYy
MTdkYzQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2MtZGFwbS5jCisrKyBiL3NvdW5kL3NvYy9z
b2MtZGFwbS5jCkBAIC00MDEzLDYgKzQwMTMsMTMgQEAgc3RhdGljIGludCBzbmRfc29jX2RhaV9s
aW5rX2V2ZW50KHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LAogCQlicmVhazsKIAogCWNh
c2UgU05EX1NPQ19EQVBNX1BPU1RfUE1VOgorCQlzbmRfc29jX2RhcG1fd2lkZ2V0X2Zvcl9lYWNo
X3NpbmtfcGF0aCh3LCBwYXRoKSB7CisJCQlzaW5rID0gcGF0aC0+c2luay0+cHJpdjsKKworCQkJ
c25kX3NvY19kYWlfcHJlcGFyZShzaW5rLCBzdWJzdHJlYW0pOworCQkJcmV0ID0gMDsKKwkJfQor
CiAJCXNuZF9zb2NfZGFwbV93aWRnZXRfZm9yX2VhY2hfc2lua19wYXRoKHcsIHBhdGgpIHsKIAkJ
CXNpbmsgPSBwYXRoLT5zaW5rLT5wcml2OwogCg==
--000000000000ba0f07062b09103d--
