Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490378F4F
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171980; cv=pass; b=oyUwRkq+8hy/QykH+uQO9m+3KDIGFxP3XzBlophvZ4gI6QjPEHlzFlznHLuBUpQwwwaKSdg2EwiEhSiMbhZp5ch48PTMrXTuFjVsE0rsGVpbJVsT6aiSnoFyfkF/N6ORoIyep9UWvTDKbRpO9OpJj6DD83J4xg3G/LR1cjI/0+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171980; c=relaxed/simple;
	bh=qESkdWkeEYOZ/zm+GbaaLDH+NyFXFPPpR6ozCF4juac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0Y9sAwAiY1as6RzLBp8KN8I6rH0b9ZLIPAayanaVbhZQvr5wP1V04JJ3yAa9j2oJoiWW2jx9RFuS6mwC8VInWNBqwxTcGVbaAeUb30wr6gMOclERZfzS4qYbkbOlJR3WuffZiIeXewrDmF7hHYttPWrsEfTNd4T2aS3abdlsl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYlWdAwu; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYlWdAwu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d64313c39so3154699f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 06:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776171978; cv=none;
        d=google.com; s=arc-20240605;
        b=CmgKQtLcHkjcx9tCVqpU4EWjshEDHmr+ReRmqnF1jVUNWQ6g7EJlVOejpQCXm/DqE6
         3FM6Xeoj//PCPzzkSs3Y6L4Nq2ZM++QPimA4ro4ZzYjHnmigUNFqmggqpe+aoCMgKa2Y
         4RV1eVl+i5ALhJU0Kf6OVoANZ2qYdayGuFcu5Fg4Zc7TIw0I4n2L2auT1aB1MqKuTWpj
         aVcjeaWLWrVawLUDS0fdjKwETv4X9Pe/K46awmDmrpJ/edgtPXnWCbG5w1fs5qZ5lVyX
         vf258cvhpKVsbI/AgxT7nZWbTCepJV0pZ1u1JntkCClhpGWHff1cnxqodoa2irNK4awF
         8qcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qESkdWkeEYOZ/zm+GbaaLDH+NyFXFPPpR6ozCF4juac=;
        fh=eiPgm7xIo+rCgZNvh4DCIce35C0Rp2ol1Jxpur0bA7s=;
        b=QHN2A3lPrz3BTlTruD37Fld3kutq1W14PI6AcjS7FXe+pUaxdWqrTxmQWBqaAQZUNq
         3R48anktmnhqXccmRacRC7w1k4CnhbLIUg+1wcQwXDj6nGZJU3+0Sl7wnKpIlnp0IfP4
         bSsWsQfViG5WLRsftXesPTgBIcFk5NbBC6xBJdJEcSHQhhJJIXLp/ytxMKZ5TSbAJ24+
         2YysTLnxp0kdI2Tu8GGNvSiZq6TjehOG34EScOY9nV4sBlBR/8Prg1D/KWAptV0smCQP
         QO43z+P03ni1L0qaV8hkdIBUkUL7H3YjY02tsVaIkKIZ15YZCICO5tS3XoGaOy27xhO8
         +3Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776171978; x=1776776778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qESkdWkeEYOZ/zm+GbaaLDH+NyFXFPPpR6ozCF4juac=;
        b=qYlWdAwuhgREWjFx9hu74MKNCBdjMg67eajASIEN5jSUuZgONg1nj7hlCHCvDpLxil
         9ORL2MXReqNmtwmLXCXmQNDEqQyhYfbwn3I5yx/kzPSSkJPl+g3S//qDjAiUykpCg+UM
         8oXRzoEQOMqBRoKH0W3CUPyi2cit9E7WH86GIunG0MqzKU/Pr9txrXlnyRJ3PMf3z/uh
         cn3QwjmgLla6TD5+rZ+66lgSMjFxgdkf3l3gKsWT/JCGW1Fs9Ci9Hmmx5B0X132re5Vd
         OPmlu0iau84jMuG8oCwIzswTCaY83SyoKiFKZ0Po/JJyCVMRERpawmpCezFkWVulOS9+
         Fp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171978; x=1776776778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qESkdWkeEYOZ/zm+GbaaLDH+NyFXFPPpR6ozCF4juac=;
        b=sluTreM/7BarUgIpZQD6Nu5Q2DTQjtinNyw1a7YWAFIUb1tuzuAEEm9cuV2lTrdLDg
         zqidVxW0s0LsaxqQF0Q7zmanzg3nVVFZP8Eej2FXtGMIupdIJLPAvWpS6xil7g8pxouA
         Jcq98W5vnw6/q3MWHXGe//HQLk/Q4sAq+JgML8d1GwMBxPx7HTDPcg0UbBJn/TQ7jQCs
         7snkzVNxqOgA6V6cUgjXcAWKJ/7ZEBBeBO2eNOeGBD42W0BrIPdFsAZnhZJDtB8OI58q
         gnG5ne7YJgCZlv7oSmlanabtAztuWlVX7wVOr0hYlun8xwONA3U17QyCauMiFmAgUeIE
         2TSw==
X-Forwarded-Encrypted: i=1; AFNElJ/m6MdoZrWAvhDhbpFwoP1gQwhzaK+09V3zUq96YDPv5tEYqRIDH8lw8LgnYV/R29bB+HiIspO1tqstCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOX99pvRXXXHuBslnFmbSwCvaIT8JBGJXPDBytu9QVLy1XQfYe
	CDVIKCBXXcLyZI7hS/rU6yYMt9lz+WAP83VVumofjzrtukdIMQsL9tdsaKmcd6xbbfA2Ag0HleX
	hRLTKnsRNhWLJHZgL0wgJMFe7gVybptI=
X-Gm-Gg: AeBDiese2aKwXvPmQo9vsWKj7xV/UNCMeuWBbykawN1E9OBuqCIBIaM6D6HhCGiBDl+
	kQqWVYWRFqC/ZNFAf4NQo1GC4+RNFBXgsBZ8tzZjLx8rFhwaFx1yQeOWpi8jXKeAhkU7lbcr22k
	uAqMdWgVjfe73wnAhhAN9dV3Q1Om1mMUAPI1IWbRTv4KFLlueQUwLPKsa4rmiV2OV2uaIfFicnV
	CK0da7FGWT1B/t+AFOseCe8T3LKFRedMQpnlRNs5b9g/h0ePUI/DR7sCHWZ/tJrNEnVtNrqQ41V
	7z49gD8z5hfNeuvkyn4IV93ugvbQhX/YwOlvu8vCr2Fvi9CF6+2/l8Cj3cKAtkVyiIjuK00U3QS
	52jW+m11eB13sRd/kG265+6jXnWZ+L1UumZczJQ==
X-Received: by 2002:a05:6000:2305:b0:43d:7d24:b4ff with SMTP id
 ffacd0b85a97d-43d7d24b7d8mr8110322f8f.40.1776171977619; Tue, 14 Apr 2026
 06:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
 <05e1cb0a-18f0-412f-87c6-99319b18af52@amd.com> <87zf3tp6p4.wl-tiwai@suse.de>
 <8cd14428-24a9-45fd-9286-9d9f142b32b1@amd.com> <CALTg27=bxnP40aP+AjexxUMF2=hvbXnR4uurceLsJ5h839L9eQ@mail.gmail.com>
In-Reply-To: <CALTg27=bxnP40aP+AjexxUMF2=hvbXnR4uurceLsJ5h839L9eQ@mail.gmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 14 Apr 2026 14:06:05 +0100
X-Gm-Features: AQROBzAupKtRx4oshBXTZX-osjF8LQMz6mRFnZ_PyFzn3mhWHQU_1o1TMiZCXmc
Message-ID: <CALTg27kB4+R0HU3RhrjSB7N8ysLwpQeikbYvtGCfTYr55LqPRg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by
 DMI ID
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

> If you end up having a good experience that could be the way we approach
> this problem in the future

They just got back to me with a test BIOS that solves the problem BIOS-side

Not sure when it'll be released publicly, but in this case it seems to
have worked

On Fri, 27 Mar 2026 at 17:35, Stuart <stuart.a.hayhurst@gmail.com> wrote:
>
> > If you end up having a good experience that could be the way we approach
> > this problem in the future.
>
> I can certainly try, but I've already got a pile of issues stacking up that
> they don't seem to be interested in fixing.
>
> Hopefully this will be a simpler fix for them than the other issues...
