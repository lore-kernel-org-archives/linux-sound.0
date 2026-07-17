Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4F35E944
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784323130; cv=pass; b=QkROUppwSHHxOVB1CPAxjUgq/TXPHRZ5UKRWmHRwT/zBX68IreudXmSU08m3SmiYl6v+BqBy74ptGEdU+NvQzNOv3nod0bX8jp/L7+apRWdrkuzNeNSGKiCGvSQWTN8umOFOXt0MwOtKHtxm/zbVWfe+aG8rHzt7CrwDYeZ58j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784323130; c=relaxed/simple;
	bh=QnFT5NOWeVCPOfOdR3thIX4iQ4NnVkBm0ATNAeXZ5eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SW+qK9DAjv6lhjqhUnsKyPK/YhkwMbw8KwTKwmIoub6L1CD7XZ6nVhrbGX4BKQWYfTgGZt1b7dprc4a8n6iymGy/XraTVM9lti3xukAZbYMwwxhoudXo/r4HeA0uV+nK7FnFUVrCLWGPu+txHHFEZQENM1pkC9nYB5EkNf8rjY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l/DEWoXj; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l/DEWoXj"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66825847b2cso2244262d50.3
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 14:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784323127; cv=none;
        d=google.com; s=arc-20260327;
        b=XBRwh7m0oNnsOUUkU/PILb7WRFpAnTRhvpJeHX2pmrSgB2k2ZjLdpPnoFh99RQlJRW
         W9EzOCOzpfA0sR8mS2pyC3E4KeNEtUq0r+w53/NFSDaBV+02wxv2fvgXQWA8YU0pr8eH
         AlE2IHjFAV3lYTyyd0GbMQdH8C4DSieWclnfxWpl2CgzjcKZLCw549Z2dgF9zxI2jAoQ
         eHJjFf1xrMfNngmHproTIvpp6F5AcHFWsnIJl+wqrR/5HkvyIT5seh+OvQq6pjEE/r+L
         /lD7rMnVOR3LPtCG+rNdDwjlb5/YBZq4N+EE9F1jiZO1FJ3AnaQtQDTGyHuwKjXzyTt/
         lEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QWC6rs75442FseDwWQTWWLd5hru2GYscqfZYMc4jX4E=;
        fh=OtVEDUBn+RirUKo9sBUgOdmgvoa8lSP7KFeYnlU1gyM=;
        b=hQRJU38FW4nudPX9zAfzUKdPdMRuJLenX4eOzvPBG9egKwERlLEJD1oq1XKGtxZiYK
         fID3uAGde6FhCASWkdMvKhpY/urIrBU6Z50Sl00PHa1a/CO905zCXZtwTd+hEecwoSn8
         6EM0s+gEoos6zYJRI3C2g8PMhv4q5QEPtii1MNxD/V1ZBd0/OAjJaEz0OkbZEo+tGBL+
         5d9coGk34D7kfsR4ksChyKfGhimcHvSCadrFcEnnoa6ws7UutFp695sRIoP5+qvkuySb
         Z/QuBmp1XqAF1v4EtghbKTqRp14AcRUpKEyGFhgYxS1yThB8kp1zYG/CuR5QE9Z36tmT
         ua4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784323127; x=1784927927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWC6rs75442FseDwWQTWWLd5hru2GYscqfZYMc4jX4E=;
        b=l/DEWoXj5laUNueWfGsmO3EvIokkJGCa8rxvDQh7/hPIU3OwKuFpYDI/qEwRgN/mk4
         /TKxyqTwDqax1AZnu0s471Q1Gs/m99TJ3CxFnIYwDgF4yk2Zj6c8REoDf4sXwlbDCoYY
         AVU7AIw7AqM8dwBi79m6CHOeu2seMvIMaXrZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784323127; x=1784927927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QWC6rs75442FseDwWQTWWLd5hru2GYscqfZYMc4jX4E=;
        b=slxuOPwhzsvrjc9bG2XuGR2TZ/gCeqmq50825wM8MC+IMIpOjALMGEN5jMC6jSxMZy
         9Vmyzv0eSmjINgXqwXvlRGGtMghdIg+HG47mCL7V8L/vfyVIuBEqD4lGz1Xpcem2FGo8
         to27zFczlK+y7SzqMBbS21Ky070JA/p8pTZkBEBWzgZVB2hPnyMl/mgIVvBUFePIdKUs
         svGc1+wK3PwbuyzOMMG9JVw/5wTJAZeH5HLUAfCBJ0WnfNHxiRbYbdIs09pvH6M2vaJE
         aECMDAoGjt077nDBqR07/p6dmvcTdRBjtvHVXVtDChFqzw5Ab2QhyWbFcmNbwbh1qxNV
         SeHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2RyrCcR9vULTId8+HLLbzRnf24Dh3ROQuGJB6qccNDqNfxspbginWp1VTp5OXQ+Leu8ZRbUVbFPlOVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ5kn7+EUAv7vxZsbNnnk36CiQ00Nk36i+dLPy//IoTR7k4ix0
	UDFCafFScZE8AZnDuHrRXLRNQRyR0Bxp5re4w9m/owlsU6Wn5edIj9SX1JsU7iaMnN91TZvkdnN
	UncVNTxco3ClUP0jyCw1IxS/BV/XOM3JlXT+xj21gxpUVt1MvvmxRKF+2
X-Gm-Gg: AfdE7cldtpryP3KRDfZ0Q4X5K2liEKqhKLDdCNdhJGJVuaCXOPgmn/0V5V6xAsrK3rb
	Btkfktk3ALK7uWfsDCtpBc2L4a7xkFAhUjLiuGyOnqW5DJehQqB8BRRggq+BjxGjGOUgQxqNWGJ
	KbhyVo5HC04DWQ3nJkNXAhUcTNiTLECp8JUgJs6kYXEVCMYt5BcP6PZ5K4xMvTfcaqc3XBH9tpC
	eNflN1+VjAQ1PPSVEwKuEwpecYBUI5qYE4ZvTUZ9w3AZUgSY3IX+gEcgLSrVek=
X-Received: by 2002:a05:690e:4548:20b0:667:ef19:6705 with SMTP id
 956f58d0204a3-6683ba7e92dmr1014795d50.12.1784323127262; Fri, 17 Jul 2026
 14:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
 <87qzl6jf1o.wl-tiwai@suse.de> <CAB1bpFCNC1NWYpBRzzuxQMFN2wugSYUq2G6tkeoiT=ThUE094A@mail.gmail.com>
 <87se5ky9re.wl-tiwai@suse.de>
In-Reply-To: <87se5ky9re.wl-tiwai@suse.de>
From: Steven Kendall <skend@chromium.org>
Date: Fri, 17 Jul 2026 17:18:36 -0400
X-Gm-Features: AUfX_mzU7xgwcCC9nWa7wu3F3bFi6cwSyRlncXDpg13abh556RS-FL7kkfU9iiI
Message-ID: <CAB1bpFA5m_H2-9ksFvFNyXdrAirE+W3VaLuyRDX8Ncv4-V-dKQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 > Have you tried to turn off the runtime PM for HD-audio?
> The question is whether the unsol event doesn't work *at all*, or it
> just stops when the codec (or the controller) is powered down.
> Also, CS8409 driver enables the per-node power-save feature, and this
> might influence, too.

I tried this before (disabling power management) and didn't see any
success and just tried it two ways now:
adding a segment in sound/hda/controllers/intel.c like

@@ -2306,6 +2306,8 @@ static const struct snd_pci_quirk
power_save_denylist[] = {
        SND_PCI_QUIRK(0x1028, 0x0962, "Dell ALC3271", 0),
        /* https://bugzilla.kernel.org/show_bug.cgi?id=220210 */
        SND_PCI_QUIRK(0x17aa, 0x5079, "Lenovo Thinkpad E15", 0),
+       /* Dell CS8409 Warlock MLK */
+       SND_PCI_QUIRK(0x1028, 0x0bb2, "Dell CS8409 Warlock MLK", 0),
        {}
 };

and adding a segment in sound/hda/codecs/cirrus/cs8409.c like

@@ -1606,6 +1607,13 @@ static int cs8409_probe(struct hda_codec
*codec, const struct hda_device_id *id)
        }

        snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
+
+       if (codec->bus->pci->subsystem_vendor == 0x1028 &&
+           codec->bus->pci->subsystem_device == 0x0bb2) {
+               pm_runtime_get_noresume(&codec->core.dev);
+               pm_runtime_forbid(&codec->core.dev);
+       }
+
        return 0;
 }

I debug logs showing both these firing and
/sys/module/snd_hda_intel/parameters/power_save reads as 0. However
with either or both of these changes applied the plug events are still
not detected on first boot, and the "fix" of closing the lid and
opening it again still restores jack detection on Chrome OS.
