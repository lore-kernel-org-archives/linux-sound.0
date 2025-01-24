Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1F1E7C15
	for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737759523; cv=none; b=nfemHvpsmjOCXnsjlJ9g+cYJR7CcVvhCdxBI7cg8ABXoDHbTkx6+XkLmJz8w2dvpJcpqnlUijaywva/zB84P35LfZopj3pB++tGAULHkOqzxGy3vS9NO+mbj6I8cofFf1RecWSx5O9nC9kp9kUKURG82LnvBrr/9FQS0ePUSmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737759523; c=relaxed/simple;
	bh=OEQ3jUjB+3q/qo7ygcVMCAkuceK3UWfEIXazcCVC5Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCqzib7awl//yMUL7M7FqpzlaipB+dwEO7YqvDTO6D0nkB2RexxlSc50wmhwBS3Cz0cnUdm87BOZfiNX97EsjwUX0xShGpHGGRqjocvzfC17JY8uSlolDn4MVi8o5leIsK/UgT9t+n7h8a9GJi0A3l6xGZGgZiJHcN3h+2Kc6xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anislandsomewhere.com; spf=none smtp.mailfrom=anislandsomewhere.com; dkim=pass (2048-bit key) header.d=anislandsomewhere-com.20230601.gappssmtp.com header.i=@anislandsomewhere-com.20230601.gappssmtp.com header.b=Kz26SWlX; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anislandsomewhere.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anislandsomewhere.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anislandsomewhere-com.20230601.gappssmtp.com header.i=@anislandsomewhere-com.20230601.gappssmtp.com header.b="Kz26SWlX"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-851c4ee2a37so180967939f.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anislandsomewhere-com.20230601.gappssmtp.com; s=20230601; t=1737759520; x=1738364320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx7l7ncsWYumDRtlpN/AeqRRXbcsWJdhSjfHDVPZ+VY=;
        b=Kz26SWlXfaxliwkFxxv3fb7fVG/aBQ9TCEtW2HiYMky3XCCTx3zVhIOsz62NIpTGz5
         HxBAK+YWA8bNU7Ik4dVdUKC22EbE9LEyjs1cGEwzyziafjsXIqsqQOtJJms8mkEL7MTL
         8CjE9F22jEmjKjMiEXz4Z2NUCQnrWimqVZeSvV8afAU/RH8Bdi5tJELJ1ge3t2oGJw6F
         pkNX/9ttBAYiQW69sJXD+IU24s8wvzd9dJBZKBxEDQxJbe2LT8K/nrUpx6D1qRmjTv9D
         6T5q1c/M69CCwTF0Av5snRaoFxoM/v73SuE5buzp4OIw0o0HZZ3DL4c69kHEJhkgBIWW
         Imyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737759520; x=1738364320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx7l7ncsWYumDRtlpN/AeqRRXbcsWJdhSjfHDVPZ+VY=;
        b=Xh0cMZ0cXfKVmPJw5kvUqlklsXWyC9tFk2LkHaWvVUlIK06hVa1EbXsPkKM/Hx4WeA
         IALzBhT2o+CrPpqsT/Dad5rTrGjaM2MmG4H23tuT2yRlpOlRINtwlmNIyvm/wtDakm0I
         I6WsAJ7FCMSYx8QCvUD+ks5pDwO3+G4FrKLcMfnkPyPY0IqD12dcA9MSvF/sMTISihEv
         LVMQ2CeDrfAXzOTo0B9+a8sxJD+LQll7AiOQTlf1CsfQTyGyKGaxsjKaXqO0Ncjt6Ut9
         R/LVFFzwRRdCxxonXQVX5XrtHnd+S19VdxclqOlkPOUI1EhRl23+lB3GcG753phi0PAp
         QAjA==
X-Gm-Message-State: AOJu0YwkUWNu5kQu6IirSJ3GB2lJBi7uMlkJ42K1Q6o0DgIVEIU/Q9S3
	CbvNc362gKVCaz+i6x+K8+Q6Bb2/QNc1NaL8uPi5eU9ccCdHYtTCCMPJ1Zdcd3UYjeGFTMSRbnN
	/exoXqc7cYc4IaW19pnKPp0TgQLjHBrpFobdukw==
X-Gm-Gg: ASbGnctWf2YdYEF2shDUe3iog37Zdz7PsMFXHoPkCEbaehu1q+7k8EOX15FnKDAtx7K
	FUhvVzjDD7GcMSsEl+bkwJKuSMR+YlZVczxJzNvDZcEW0j5ZArG4UBSFDwh8RCg==
X-Google-Smtp-Source: AGHT+IFEnWsrYY32HJ15xGDY4Bb/EnqgzBkACDrNH53zz7qZDXGkZjzXQNdnoNyCORQsk+C4L4fNHO2iHjw6iZd2coM=
X-Received: by 2002:a05:6602:15d1:b0:844:debf:2c8f with SMTP id
 ca18e2360f4ac-851b64cf92cmr3152080639f.14.1737759520476; Fri, 24 Jan 2025
 14:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com>
 <87a5bj8gax.wl-tiwai@suse.de> <878qr38g6r.wl-tiwai@suse.de>
 <87v7u76xhl.wl-tiwai@suse.de> <CAGPQRHaDRLTRisn68TA26sBM1PKVoUcDsKSQVrCsR7MinQbSmQ@mail.gmail.com>
 <87a5bh6b6y.wl-tiwai@suse.de> <CAGPQRHYG_BUSjWSN4LH4oPeM5h4E30WSyfaRynYhrcDYT95dXg@mail.gmail.com>
In-Reply-To: <CAGPQRHYG_BUSjWSN4LH4oPeM5h4E30WSyfaRynYhrcDYT95dXg@mail.gmail.com>
From: Samantha Glocker <iam@anislandsomewhere.com>
Date: Fri, 24 Jan 2025 16:58:29 -0600
X-Gm-Features: AWEUYZmlI4iCK43LT6vVBEIzpI3U7xJgQs2uUDdMyjur7EkIJRGvIPA8siuPm8g
Message-ID: <CAGPQRHYXcbWTiKpCANEQ1mq9aUHM=v82T231fw7Ld=C-NM4+Bw@mail.gmail.com>
Subject: Re: possible issue with ALSA: hda/realtek: Use codec SSID matching
 for Lenovo devices
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000ec9129062c7baaba"

--000000000000ec9129062c7baaba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Sorry for the delay I had a build pipeline problem.

Confirming your TIA patch works perfectly on my 16ARX8H. The TI amp is
detected and enabled correctly again.

We're including it in the nobara and cachyOS kernels.

Thank you,
Samantha Glocker

---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4210bc8..453835b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10888,7 +10888,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
  SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7",
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
  HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7",
ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8",
ALC285_FIXUP_SPEAKER2_TO_DAC1),
- HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H",
ALC287_FIXUP_TAS2781_I2C),
+ HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H",
ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID
17aa:386f below */
  SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7",
ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7",
ALC287_FIXUP_YOGA7_14ARB7_I2C),
  SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7",
ALC287_FIXUP_CS35L41_I2C_2),
---

On Fri, Jan 24, 2025 at 3:04=E2=80=AFAM Samantha Glocker
<iam@anislandsomewhere.com> wrote:
>
> The Texas Instruments amp was not detected on kernel 6.12.5.
>
> You've understood perfectly. The patch you provided also looks good.
>
> I just finished compiling a test kernel, I will report back tomorrow.
>
> Thank you,
>
> Samantha Glocker
>
> On Thu, Jan 23, 2025, 05:07 Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Thu, 23 Jan 2025 03:00:29 +0100,
>> Samantha Glocker wrote:
>> >
>> > Hi Takashi,
>> >
>> > Yes confirming it's a regression. I haven't raised it on bug tracker
>> > because I was pretty sure I'd located the regression as above.
>> >
>> > Sound was working on 6.12.4, and non-working from 6.12.5 (thru 6.12.10=
)
>>
>> What exactly do you mean as "sound was working (or non-working)"?
>> I suppose it's about the speaker output.  Or anything else broken?
>> The symptom needs to be reported more clearly -- only few people own
>> crystal balls.
>>
>>
>> thanks,
>>
>> Takashi

--000000000000ec9129062c7baaba
Content-Type: application/zip; name="alsa-info.patched.working.6.12.10.zip"
Content-Disposition: attachment; 
	filename="alsa-info.patched.working.6.12.10.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_m6bczvk30>
X-Attachment-Id: f_m6bczvk30

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
AQABAGsAAADyHgAAAAA=
--000000000000ec9129062c7baaba--
