Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87018F9C0
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062299; cv=pass; b=INn+WpXEgy34uZDayjFZLrJQCCe8FyCzPRmK0k5z7YyOm6yP7BiAJKe3vN58nCVucVFL3u8S7ThwvHjEO97Dkwde0ToUrEp0ADcn8sYdqiHihGGg8VmjQHDA9DwffZ8kXydTHl2JDZfu3WQ/zuHuShWNs3Ux0Dw9pK716ozR7Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062299; c=relaxed/simple;
	bh=VX0NdTOM4sOIbkDgSsXqo2rQbAYQKJNyyInGm5vtNe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htd0VaEQ/aVzCFSK+EfjwwP1zI7RgnwkXXaKPCOa/5TPX+CdTL5j7ZLHB/ZDq7Dn6fxPvYiy+sy7fxuH/k2PwiL2q8Yikye1JD2iKTI6hSqIJQ+wP7lcde+Kda1jUOLo2TIxqVWTjEOvNb9NVfpFGGHwOMRVjCW372S9d7Ppxb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=accosted.net; spf=pass smtp.mailfrom=accosted.net; dkim=pass (2048-bit key) header.d=accosted-net.20251104.gappssmtp.com header.i=@accosted-net.20251104.gappssmtp.com header.b=SrDYirvR; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=accosted.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accosted.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=accosted-net.20251104.gappssmtp.com header.i=@accosted-net.20251104.gappssmtp.com header.b="SrDYirvR"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bb54bd50c2so309784e87.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 14:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791062295; cv=none;
        d=google.com; s=arc-20260327;
        b=i1x67KJB9nxBMa6P1uy+W8qL1+gOxdhvzpGizyK2fN19fA1OLiEjK9fYI/jAXBBiUM
         4qJjzpVrm1XwjI6/7E4PydfY8dv29dnK5wHDuCqgsqpn9OOffRQ24vbN6zpgTtuf8wtq
         /uX2Azr1H+3w7OSgpwTl+6//Wml4hSB4xrl0ZZ92GEbmAadcqY+NNfambPe6xUHteKFn
         7MbN3yKuiEC2R4zimNgm3gDc/e57aiTryPuJmavy9CVeql6m9Fk4Q+rC//jbovrPSQCy
         q6AmYti6cu74voG6WV14TBdaMl+q2eIRTx2+F4r2EOvPQA5Wa2oAwzu8EkEqAd32DTdD
         LSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GVv/8om3f22rd61eBWz9TX+qnr89EMQwQT/zjGi7PYU=;
        fh=lGHgs9L6cN4jWRDFqlHMheUY/8CO8zqWND9BzV1Qucc=;
        b=Hq6WJJ21Eq9cTgwy+Sh2yLRfky4M21Ay1mFMBxMsqRJM9dYC7QC+Wi63kYZKHHwZD+
         uSah/+V7/wS3BPy7omz7uCRG747fb8oePTzns6E4Cw6YH67+c6y+LM/zUdlaaxudW8IL
         4yufpFmzQcY8GyHi1HIxY7Z1awbfdZUrPqddzcxlfopXoB5ZM1DTgWizGijLc9Df4YLX
         vfmmh0ZCAB1SiaDWZv4Mq3pYg6PJdb6KlZdGYt+Fj/T0iEZ6MSuFsztmWFphAskpcj8C
         Uc15uHrLez2WpVEvs23M24leyLf+Ryp7ddPRaWOxRlpy9/myNMj9Z2wctkMfSFhedcr5
         gSkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=accosted-net.20251104.gappssmtp.com; s=20251104; t=1791062295; x=1791667095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVv/8om3f22rd61eBWz9TX+qnr89EMQwQT/zjGi7PYU=;
        b=SrDYirvRZHcZRR2zvOXR+i+Ao5vUQ6WjvM0A/nVfsr6ozJnrkMmk+eSaO316EGPmUj
         2lJ0siGOKLYYtxInmfzdeguqAbRohGs7Di0YLHqL2Iqe+LElBnLTLDoGrQzygQRPqEtC
         hhLeNA8PvIYM/S9dSW+pQrAz99DgxQhY2JMBGigVgp7W+IP8DlB1bTayrlQt/am0LvOc
         EqX8znD20A6z6kxGN/v/CZKfd9abVDOQlAnYyDaaxFCURmkBSiJVYnIi8IZsa2zg2wvH
         N9HBcq+ijCw4k3o5BVNrzLpEI3OXs3mGwW3zRD6WmJqWDna7yaaLk6WjI7sMRdBmEYt0
         GIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062295; x=1791667095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GVv/8om3f22rd61eBWz9TX+qnr89EMQwQT/zjGi7PYU=;
        b=nc1bO0wNETzxVAc/w31VwCQz0qSAacOWxMRLmWFnt28kp62l/I2KkQWyAtBMnwj5e9
         KNvJzU4QiE/dDl+3/nDQp3c4l9+DPyKLSJYeP5g994T91O0LexZoAx5ZK7gA/L0OXqIN
         21nfYx8yiKPsw49SorpIPn7FT3tut8g9T4BQHliOK9BVck8ilw5/tR2B7OUymjxHfvHk
         HVnRMeTUmVMv2WWgv8Vp72iL7CHlmi4bsnANqk8/0U1xdgwvyGRAx5VOrc3mrdGIgmig
         R9zwiU8nU4nPKemGC9+ZKumBz356y0aG+jbqyuZHAN2ZD2awB83rwL72ueZ1ad6VK7jk
         3NFQ==
X-Gm-Message-State: AFq9FYLvT7gxIfDPZ1N/Ui8JoeFbAZlwLyb9CiXZrdaqT1TlYLCPiXa5
	Js8BDS8Txi5lITALRj75fVpFNzRhA6RBPhmrbIYgPDKxZYrgDFh3x9DwDnlfaWf9G6turCIhXdv
	B3BETQ+h+iIhDqkNKyYPjZLqexDQsedyIP4A3HdBi
X-Gm-Gg: AYBFou1mpKM2JIRX3I8x0f2uF+KdcBSpcLPMNX0wpE6yYjuVjwioOh4/pkmCYFEhS59
	G8ta7T+la96g6sadYyt9y4c++AVqM1+DMG2tSJkk5JPnoGkJdPRDixMdkvWDvaCldEAanOCSnAe
	7pB4gKa6kooPyIGt2g4CaTUMm4aXQ5j54f3xTa0uocUXNMC+KCLVHRqd7b6pvlHXfC/QTm9bMN4
	ZYqRhgxmlZ6G5P5mgJKRts2m3SUMnwLUPTDMAr/GgZLuXJIvwJok4NC4onasxfshB44AF09irNW
	jLuruNbGLDNmLPp23aecxFEZ6pY8CajJcK0STrGgN3ptEbk6VDVd9DNd
X-Received: by 2002:a05:6512:3990:b0:5b8:f4f4:ef23 with SMTP id
 2adb3069b0e04-5bb93832ecbmr2331029e87.3.1791062295029; Sat, 03 Oct 2026
 14:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <871pbsnce8.wl-tiwai@suse.de> <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de> <8733uoys02.wl-tiwai@suse.de>
In-Reply-To: <8733uoys02.wl-tiwai@suse.de>
From: Arun Raghavan <arun@accosted.net>
Date: Sat, 3 Oct 2026 14:18:03 -0700
X-Gm-Features: AclHuK_U3mmJXbiOwDoABV3L8eyQCg4ObYHMa4UmBbAgQKhWp8gFep3-c_rKTAo
Message-ID: <CACuU-+gAQPD2Xm8eqZR8AWTD=wz+SCNEGBmRL01KmNKMCS7zjQ@mail.gmail.com>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 09:41, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 20 Aug 2026 16:31:48 +0200,
> Takashi Iwai wrote:
> >
> > On Thu, 20 Aug 2026 16:02:45 +0200,
> > Jaroslav Kysela wrote:
> > >
> > > On 8/20/26 15:34, Takashi Iwai wrote:
> > > > Hi,
> > > >
> > > > a few people including Mark and me have talked about holding a small
> > > > meeting for the Linux audio stuff (finally again!) during the next
> > > > Linux Plumbers Conference (on Oct 5-7 at Prague).
> > > >
> > > > Has anyone already planned to attend there and is interested to join?
> > > > If we have enough people, we can try an official BoF session.
> > > > Otherwise, we can just have an unofficial session at lunch time or
> > > > such, too.  Just let us know.
> > >
> > > Hi,
> > >
> > > I will be attending Linux Plumbers and would be pleased to participate in
> > > a BoF session or another type of meeting.
> >
> > Awesome, looking forward to seeing you again!
>
> So, the conference will be opening on the next Monday, and we still
> haven't planed yet -- business as usual :)
>
> I put people who showed interests in Cc.  If more people are
> interested to join, heartedly welcome!
>
> If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
> AM/PM), let us know.  Or, since there aren't so many people, we can
> just have a lunch or dinner meeting, too.  If you have any preference,
> speak up, please.

I couldn't make it this year unfortunately, will start to get plans
for next year rolling a lot sooner. :)

Cheers,
Arun
