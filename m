Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A202349CE2
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 02:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314868; cv=pass; b=I/XslK5cxf6QEXiflGlCgTf6SZNGj90UUH0QYepn0GLr1oINvY+kOY9g/ukL2MT5xpD1mX7pNUo1u9hHsJcVdWsC27UnurCIE5CPtsJms54ObBeaorD81cCoAAKIdlOcu5WMgytVpWrzkkLkVnwHbmfSc48XdHJKARY+kaQ1QTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314868; c=relaxed/simple;
	bh=udwSYPTnDPH4KqIRvNntitw+jHLbGls4Gy7WpueHMVI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HJ31yWFC4XLtT8ll31ThLztRAwlVxNVRT6WsN3nv8tNF18+GhPDBOvSMFVNC0oubYKS4nQIsMWUbRQfjLINRxQW1VU1W9DxYkJhT4lzJXp34/lTwDOHnKSU6n9jWrqZxJ5ji4E4BXomVlk4wRtz0MbmkmI+UwVk5znt1BAYQO1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJZ36+mG; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJZ36+mG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e067e908so465742f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 19:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788314862; cv=none;
        d=google.com; s=arc-20260327;
        b=aAN3JxDbEg27GsgLspOgaFyNV8B2sN+yGvlZWVoVMl3wdAUyAR0ZDfwxzMvnepos4m
         JtbN8ymsaMjOWGYvHGLxlTnWmBBZCtwJtklVukdZnfUm7g7qcyOYzgzO6Oe/Kmbc9Dsr
         9vKqGOZ6vkAUnGfFtlnajKExCw2Z9ANk+ROtKNb4lsRya8rXNqIj+uvlg03a1Qu9C52p
         oIS6XncmTYRJWLcZNxu75z2sSMAs99p8n1cUWl8Rt073UV9LpTLxDgS9b97x/SWQEmTU
         hltXHs9lOl6knVCCiy5CFElO1GPntrn6Gt3q9NwnoussVGIyiJ0x+TFoXMju8m6HYu7c
         f4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OkEvfszeR7XeofUG84L27vnMBsBKLUpywBPEEyg5KRI=;
        fh=mDyV6qAHfGG4rG3NIPxHh9BaqEZxTDCgH6nS7uxdiJc=;
        b=OHM5vRTtJhqMxrp0NneesvwiWz1fELfpGyv0JXyJMi9/g1BsJ35DwL72HGnJdKYpMG
         B1gBjyQ9dLO35TvAz8Qcf5W00MH2m/dnoXipLUCKW1mTlNGga8t2aTsFL4HWgGErlsE7
         gYLHLA9++V7AxpoYkyg+E0wr0KHqaJj4S+KZ+XO4l/+Nm/eIPvGaTwlr/tFz8HmakE/J
         kksWL3ONKhmlYoxX56U+7334bgrWBs4xobqUt/olVyaOry6o2T7XtXDGJ9Rd9DVnlzEA
         6Xt1zqeHplGyooBnXYyfD4/i0Q1fkGJ7nrSc/pI9JhvzTB+/pPlK4ywP2OmE50bpDLg2
         DYGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314862; x=1788919662; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkEvfszeR7XeofUG84L27vnMBsBKLUpywBPEEyg5KRI=;
        b=QJZ36+mGZEo0L8U1mDOTBRSmszoBeYjntNvYUwwOPmeDs9y0T+QeKJqIo25XXTpr1x
         IgTzZX5iQWIZiXh8l09NOfOJOzvY75MYBN8ywzmApSe4EoyxmTd4TzKMkB5/ofLw1ZMh
         6k/s0OMaI6mPy8aU4qag9htu8QfROMj8BPX5scANGPOH78lvb+xl/BYrpUfcrp7oKrtV
         A/pUwls/KRNh34EPRqK/Xvj+jwMYP6ZqyQ5zSceSClHT5pl2MbV3mcvGz4NZeXimkiLO
         yoY4v+AVY5D7IGpYyYOnwBtUvYxebZuOUYv2dwJCD80H1JJ0zS7QvL3OvWMC4A7QTfkm
         ORIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314862; x=1788919662;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OkEvfszeR7XeofUG84L27vnMBsBKLUpywBPEEyg5KRI=;
        b=kZVIMzKEGCL9XvwBJDq83SOdRufh6MNbqTPI6H4MjkTHHV5oI1LVuXpXQn5t2dFEQQ
         R0yca9cAgUkHGdGPOMfffl3TmDQuaxceyn+fJY7Zp1mtuePZzqsb0ov3FbVlYPtBG6rS
         ikLltRTbD2wNePjYZ3cryAwFYcdNKXsxIq0EgctMAu9zRZ4gJ4m/z4nn4Bm43uC/+Euf
         er6YncdUSLPV6jP0DzyG8QYofNFHaBMwPI9EGWTRhWP6tLdIrbdJBONZL0qFNjcY9cvQ
         hshaH2x6lj6iw+V1hBy8XOAMUrN4fJ79/m6N1/kRgXXxGCvyy0oE7W4TNKKg5Ja9Zf5d
         1ZSw==
X-Gm-Message-State: AFuF++kjQu9h4ZCR9X7ZdYJvE78XO1vgchTEUR09DhBpXS8fMSkmGfAZ
	lELy50xPea1pTxSYo6ppyeIQ7sya1yDoKoE5dsultVfRGtnU9qQdkRnoBJimpIk30TO845yLajT
	qshGQjBZPyyxcrKAF9vjMiBWw9+bh9mQ=
X-Gm-Gg: AYBFou18hrvzqyd//1TEdcoHaoVaUYJXCy/oyC9hP6T4pGnNykGN0uLGMTmE2/HQ8kk
	Wrwzy6ZW2W1dn2mlNqZF0hOwlADmdbu8Z0PubEQ3HV4CB8C+tx8shtg21miXWgYGMkmsYd2sUWE
	60waUnyw6PG417y9fPrweQMUK6YeuMBJsSpHjasT5fS4GVNRsakpl1ZTIgdz08dBXS/TnWrBJU9
	wayx70j7tvmKWiK57DwFCP9AcU/Lbgfk0sUd2rBfD5aiyJRU/pVs7fMJw5nwYwPQ6HFoPsXSJoM
	CBbqkpkxnwyeaKgdDcO6Gk0QG7HImdbNLiw8P21pYiU=
X-Received: by 2002:a05:6000:41cf:b0:484:41dd:ff3c with SMTP id
 ffacd0b85a97d-48488f18e96mr2080023f8f.18.1788314862035; Tue, 01 Sep 2026
 19:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 10:07:30 +0800
X-Gm-Features: AcwNN1XD1WHiZ4r-gMwibt3Haq_JjvaYK15GwJKTwRLH0U8Obn8weilq_nSQM2k
Message-ID: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
Subject: [BUG] ALSA: ump: NULL deref of legacy_rmidi after parse sets parsed
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

ump_legacy_set_rawmidi_name() snprintf()s into ump->legacy_rmidi->name
when ump->parsed is true, but parsed is set at the end of
snd_ump_parse_endpoint() *before* snd_ump_attach_legacy_rawmidi().
A UMP packet in that window NULL-derefs.

Type: null-pointer dereference

* Summary

snd_ump_parse_endpoint() always does:

       error:
               ump->parsed = true;
               ...

ump_handle_ep_name_msg():

       if (ret && ump->parsed) {
               ump_set_rawmidi_name(ump);
               ump_legacy_set_rawmidi_name(ump);  /* rmidi may be NULL */
       }

ump_legacy_set_rawmidi_name():

       rmidi = ump->legacy_rmidi;
       snprintf(rmidi->name, ...);   /* no NULL check */

This runs from snd_ump_receive() on the USB input URB complete path
(in interrupt).

* Affected

37e0e14128e0. Needs CONFIG_SND_UMP, CONFIG_SND_UMP_LEGACY_RAWMIDI,
CONFIG_SND_USB_AUDIO, a MIDI 2.0 gadget or device. KASAN.

The natural window is parse-done vs attach. The QEMU PoC widens it
with a kprobe on snd_ump_receive (poc/widen_ump.c) plus dummy_hcd
configfs midi2, because the un-widened window is short.

* Reproduction

       # dummy_hcd + configfs usb_gadget midi2.usb0 (see poc/run.sh)
       # with widen_ump.ko: force parsed=1, legacy_rmidi=NULL on receive

KASAN: null-ptr-deref in snprintf from ump_legacy_set_rawmidi_name
<- ump_handle_ep_name_msg <- snd_ump_receive <- input_urb_complete.
Then "Fatal exception in interrupt".

* Expected

legacy_rmidi helpers no-op until attach has stored the pointer.

* Actual

IRQ-context NULL deref.

Please consider the suggested patch

Thanks.

Suggested patch:
```
diff --git a/sound/core/ump.c b/sound/core/ump.c
index d183c8a000bd..3d1a2ed3b476 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1335,6 +1335,8 @@ static void update_legacy_names(struct
snd_ump_endpoint *ump)
{
    struct snd_rawmidi *rmidi = ump->legacy_rmidi;

+    if (!rmidi)
+        return;
    update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
    update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
}
@@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct
snd_ump_endpoint *ump)
{
    struct snd_rawmidi *rmidi = ump->legacy_rmidi;

+    if (!rmidi)
+        return;
    snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
         ump->core.name);
}
```
