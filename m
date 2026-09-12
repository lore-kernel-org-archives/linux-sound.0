Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA263C342F
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 20:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243771; cv=pass; b=OL5BSkotfWKiJAkFLhv5Fj/QNx5fQ11kIy3pm+EXsn8Yk7xjdjwQuGpHZ/YVRwsjtMRciT8g1bzTgaLMMR+U723CY/akq8CLWpLNNkVOnELAS/G3FUgB3qdUx3YnABPzNvphGirLr/VNEKnJn6IxHTJpi+oE0DIQgokBh4CVMVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243771; c=relaxed/simple;
	bh=n3MqhRx/mXenvMytp/ni8E7dPCtfLaiHE2c3yHtK4ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROyQ6dwST2HGdFDGjnDMg0+z/TVH2XLi+fym7q0MfwZeUNiuHgjJM22CI5XatXaWhGWiSq2/vykU9y/aRTutnbXb23xh1YN0lpJ8YmaeJkDiBh47oer5R/WxG4X5y3pF4jXTfZCVLiVIzwMJRXef0zc2IlEooh6KOr4mOmq+h28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Pu2w6QjS; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Pu2w6QjS"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8623e5d435cso295875b3a.1
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 13:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789243769; cv=none;
        d=google.com; s=arc-20260327;
        b=jW8JAAhJbtw/n9fJ2u8koLPvsTmxiY5WtHfaZ1ID1uV+zmK1dK1f9c3pwDHZ01YiIq
         a/p17EqMbzx3Xk0XNDGBEWtRTeKc4OK/IdIykmu3Ez9zp1QtsuVfgmibIN6jW1o5tx2E
         +XDF4Td/nuxnash+B0KDXLoaohf7BTy3eq0Q+zcDc4rHFdwSMUuZDpOhQoTLOLbkU8dC
         QCp3p746aZxW0TdY+spTeIKiJSlLQAOpNRZe6v6MW/S95oK3Wk6oPwXuCwX/M8Lc6vqz
         vdfwBUrH5y+4cLkeLE8It9yZo5bx3I3JcVzqHLgZ/Bu6ONtxQthvaFTgonTnrhNcTG8B
         mKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qB21ANWRxv7n96J1JHu+XhZk0UtWY45/KlWzWPWjsSs=;
        fh=AK+DbVmRIoWfsWVNJUu+pnBEswwgtvqH1Abg8y62PYA=;
        b=lNPq12SHFnH+5KSTrz+KzoZOpN92tiA5kN4mHMkPUCMOC2t0h62Nue8cpmB1tdTIXM
         KmGp6VOdBTPZXod9gm4wBnkc6iEXYTcU67C8n98WhDwLTw5RthcQWJDO5s6rbNPzGNTh
         +dFWkvchZ+jJcD8O2pOMKwoTA2ePnOPjhmKGtcPa4Lu4eN/6kXydrd8qv8eeNNjg7kAx
         WQFU9WKNQgWfyXBaLomQLehLfEu4H9Ln2+E6E5gqeAE4lU02USBF+Bbk8g11D/MpqP+T
         TitN+vhFpnHavkOBNaMpUpMt/ceRLN8ZnqwzqcSu9swpjyJ8EUd2e4LI3LTtmY2kTGPe
         NQEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789243769; x=1789848569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qB21ANWRxv7n96J1JHu+XhZk0UtWY45/KlWzWPWjsSs=;
        b=Pu2w6QjSjr7W/fUpQJmQ5RUyWMljxt0bHbeptdYU7Q2jv+nF0HexMBHMvNh8L2yPoJ
         TiS6VjhVcWtEIiK7M+RnyX814SoGVi04iVOfo8VRuDx8zAmlM+SxEWqg7Lt4i+EGmuOO
         rKWtaApxAKPzQHOvHLpySibQZqqjpGzv5y8IUXFrpRr6yrvVKAM6KDWuzayM24JDSDFl
         Ghwt/cmZMYGNsJJsy2EgzizdM91UvE5XwK8KXNeWrK7DxcEg27X71rOQA2HcePv01srH
         ccoowyhkoAmVSym2f1xflXIUcTrzA7pXReRvw2ZBQH2H3NVMJA5+l76d48H4N67m7eFV
         6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789243769; x=1789848569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qB21ANWRxv7n96J1JHu+XhZk0UtWY45/KlWzWPWjsSs=;
        b=BVO5IBq/ftk2lehFfM0gR5xya/eNDTYyJ15le+4KOWQvTqyy9ZMqzUqEOjmczSFQ8O
         bWUmO2BJb9N2SaUKRv2ZDSAhO3/5yRWe7FYsVqV7xUrHZeewCNHnSt2Hs2OJTznjkFPf
         B1GCsPngkSLYvULJkIZBiaHH6z96Y6M+EtmfesslNdwn5qxPJQ8DoaLECJBcONDqDLeM
         nR0TbtQaDvO+Wp+ro4fshF4qhxicmJ7kfM9gWfrMykpK+n2uCXgLMpfZGi+Pn5/e8RLe
         snQ/TdGdW+bGiDpinQlKEmN177wsHCU8bd+wACFsSoqDnj//HTbls0MI+6IG1ei5Z3sN
         XfSA==
X-Forwarded-Encrypted: i=1; AKwUvBxjraMJf1t+Ib88EkvN9baQBOmFknbDsUa894yUbH3UZSfzScQCVq8sQfhLszyw0pMsvzQ3grW8utA34Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mCjVhRHGGx0giphbDZi2duZeSLyL9CaN7A3SU4PrgtM5Af6YkG
	+Y+MJ10F51342mUtyUSQgnMrsxy4dpvjLf3nz7Y67ePMpF9pjAjzCAdiNUX2p9jCi6GkBoV1nSU
	Oiwske9+bvGkjgHOaW8uU0pyAYBZMsxYz/PRFhOEYoTnYdhPK7EBYtWiV
X-Gm-Gg: AYBFou2l2BsfOw6nZjIrNxKX2nmmNszJF3NoxyEXYpOhWPVOet9wfYSCjeOoOpyA94h
	I0HcYymNUex9dyyqqLirf0UmaLBfsKnskxrD81qRj1n+N5JFRQE6GhVYBcKalMnk9BRExyTCyLw
	WHKzS4JezqRLb+zvSu+6CmWHX77wNUpVuHqAu0XikvaRD3Rt0xril+ZfvF0dH4x5GVEHBcfIG9J
	Lcukv5wsFbGpjgTLnQp/OQNGoULRiyG6SDaNIx/H/7QsyQ92d88aF8N6GKdUokYLp4ZWB3O6uGW
	vzw0FFCuQMxTOCdoH3/Frldj70Flr6RmTh1Iyg/989w+1IL81qSfdLJiZhalV9oTVhob5joByub
	m/E5HD6SAqho=
X-Received: by 2002:a05:6a00:2304:b0:851:8bde:7861 with SMTP id
 d2e1a72fcca58-86b100bc308mr11287669b3a.1.1789243768860; Sat, 12 Sep 2026
 13:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <22xPn8drvIUtYgVeQnBiNqXuevOTpBAjepLz@bugs.sh> <87wlsq1lfa.wl-tiwai@suse.de>
In-Reply-To: <87wlsq1lfa.wl-tiwai@suse.de>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 12 Sep 2026 13:09:18 -0700
X-Gm-Features: AcwNN1X1dMySvkFBvnf6VyEpz9GV0R43A0JOxk9_7Dhsosx5Nt9vYTNCh5NQHsE
Message-ID: <CAPpSM+RgpkW7dxWdX0qr0kjVATYxyx2GT_ZD_mgpD6r4WetQJw@mail.gmail.com>
Subject: Re: [BUG] sound/usb: out-of-bounds in prepare_playback_urb()
To: Takashi Iwai <tiwai@suse.de>
Cc: cedalion@bugs.sh, linux-sound@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 9:31=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 12 Sep 2026 04:09:23 +0200,
> co wrote:
> >
> > This is a bug report, not a patch submission.
> >
> > We found a bug reachable in:
> >
> >     path    sound/usb/endpoint.c` (the overwrite) and `sound/usb
> >     crash   out-of-bounds in prepare_playback_urb()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/trace/linux-trace")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you fix this bug, this tag credits the report and lets us
> >     close it on our side:
> >
> > Reported-by: co+8eacd4fa193b1b28@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an unreviewed LLM-generated analysis and candidate
> >     patch. The same reproducer panics the unpatched kernel and runs
> >     clean with that patch applied. Use it as a starting point, or ignor=
e
> >     it and write your own:
> >
> >         patch.diff  https://bugs.sh/b/8eacd4fa193b1b28/patch.diff
> >         report.md   https://bugs.sh/b/8eacd4fa193b1b28/report.md
> >
> >     A guide to taking it from here to a sendable patch, including the
> >     trailers to add: https://bugs.sh/patch.html
> >
> >     Happy to test patches. Complaints and suggestions about our work
> >     are welcome at:
> >
> >         cedalion@bugs.sh
>
> The suggested patch looks reasonable.  Could you just submit it in a
> proper format for upstream (after verifying that the issue still
> happens in the latest upstream)?
>
Thanks for checking.
The patch has been tested on the latest upstream (tiwai/sound.git).

And I have checked related functionality and ensured the patch fixes
the bug (to my knowledge):
https://lore.kernel.org/linux-sound/20260912200530.1955491-1-xmei5@asu.edu/=
T/#u

Xiang


> thanks,
>
> Takashi
>
