Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N24Mky41"
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE4D9B
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 20:46:08 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28abda2fc0bso204099a91.1
        for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 20:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702356368; x=1702961168; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CQCQ4kkX4X9fUJRPobVQ0uEEuIkhhSl/wjprocVziVY=;
        b=N24Mky41sHT1udzLyTbFOBOhzCVupPe9vZmKohjWHuKLNaS6KKkI8LjVswttfaHS+Q
         PNo3qGZkhNLLoZUfi56/CEz2EgaSsbRMIovtzKcLUovxCjr2y7+BRhp2CUBEAlo6rSBM
         5t5lJTNyg7VU55Ha90dBlePjqWdWmiksaoDxJMA/MVzvsu0jD+mqw1NaS1CNaMhJbNHI
         zBNxLqYEy3pbPdp28zmSZbdJUB/Jg0mPzRk5k89k2ZibR7xL3pr1fDdkokK8DRTc4GNH
         dbQzhW6J9GXT/lg04Df7csYnjQdijHU+9IJMrV7zobBWMH1r8U3cPdYDRNjmAAYVcn/y
         dJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702356368; x=1702961168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQCQ4kkX4X9fUJRPobVQ0uEEuIkhhSl/wjprocVziVY=;
        b=gWfdld1/qiKmkcGFJaPS2/p9RdkVzLlQQ7Ek/Pti1W9OyoyflI0TzXiecL9I1rVweF
         lsqsib+aTG049IeWPYHZQESv5VD1UB+mar701a+OkX7RqAEO1puZY5FQ1Y0Vi1N9auG/
         1qU0d3y4kunvB4p4d8lDJDKeeYdwa+JupfJFtzO9hsraRkiAFgjV5AAWWpZFgEmnNLdb
         XBsG2vi2lR1fx+B2PgROfFw26P9Ub3ZvNMJCj2Zo2kWXBRbGZihwQCrW9Ep0P8xmlPRd
         qr/mnn9JZwrcsNpnmtDOGyZmTZsrex7mSEcDnKkXGZcYIKrHu709rkpxObKshrhc6lAQ
         uOVw==
X-Gm-Message-State: AOJu0YzTJE4oe0yduApJq6BOsIRCSwf+L2VQjI1Kq+jjFIj0z9ldsfGQ
	3RWhSPu9gsFYy0angWAWfJE=
X-Google-Smtp-Source: AGHT+IFz+bXvsrRKpmI2Wp0zXK3gK1BoqWzTF2YOssSr9g82qGEM7x+F7rgZbktH/urqYzBeFtalWA==
X-Received: by 2002:a17:90a:c288:b0:287:53b9:1d8a with SMTP id f8-20020a17090ac28800b0028753b91d8amr4405486pjt.28.1702356368113;
        Mon, 11 Dec 2023 20:46:08 -0800 (PST)
Received: from geday ([2804:7f2:8006:c0b7:587c:b127:54ce:1956])
        by smtp.gmail.com with ESMTPSA id si7-20020a17090b528700b00286e9f15f21sm8017056pjb.12.2023.12.11.20.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 20:46:07 -0800 (PST)
Date: Tue, 12 Dec 2023 01:46:31 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Villeret <clement.villeret@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [Linux-Kernel][PATCH] Add quirk ASUS GV302XA
Message-ID: <ZXflp+0K9H7pSqaj@geday>
References: <197f517e-6091-4044-8d60-e399ec981e8a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <197f517e-6091-4044-8d60-e399ec981e8a@gmail.com>

On Sun, Dec 10, 2023 at 09:09:41PM +0100, Clément Villeret wrote:
>

Hi Clément,

you need a commit message here describing what changes are introduced by
the commit you are proposing, and why they are needed. In your case it's
a very simple change and a simple commit message would do, you may want
to check patchwork if you're in doubt.

Also, when you address the commit message concern and are ready to send
v2, remember to include Takashi Iwai (co-maintainer of ALSA together
with Jaroslav Kysela) in the Cc:

Thanks,
Geraldo Nascimento

> ---
>   sound/pci/hda/patch_realtek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f9ddacfd920e..acbb88d777a2 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9954,6 +9954,7 @@ static const struct snd_pci_quirk 
> alc269_fixup_tbl[] = {
>       SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", 
> ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
>       SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", 
> ALC285_FIXUP_ASUS_HEADSET_MIC),
>       SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", 
> ALC294_FIXUP_ASUS_DUAL_SPK),
> +    SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA", 
> ALC287_FIXUP_CS35L41_I2C_2),
>       SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZV", 
> ALC285_FIXUP_ASUS_HEADSET_MIC),
>       SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", 
> ALC287_FIXUP_CS35L41_I2C_2),
>       SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
> -- 
> 2.43.0
> 
> 
> 
> 
> Hi, it's my very first time trying to contribute to linux kernel. I hope 
> the diff format is ok.
> 
> my fork : https://github.com/nectogale/linux-quirk-ASUS-GV302XA/tree/master
> 
> Have a nice day.
> 
> 
