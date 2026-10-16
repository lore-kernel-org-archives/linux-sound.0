Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D3C4734F5
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145749; cv=pass; b=VpeWM6usb1DMC07/VBhImiRwwHL3WleMI08OZKmN1UjvREczwoVZbSg2fkuuQVzPOOC2uMvzVusHhLKQpkAZpYu+J1u16CjHJM54Gwp4kS9QOqwwKn1Ktw+eclgxgqT1a+PaRsNul6jPMCWWq93z84KAcncGAEysTMMjVLP5UbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145749; c=relaxed/simple;
	bh=m+EcWpb5wUHZA4l/YIOJiWupQfQ1DWz+cRbbdR81dXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=diSATuhj5DxyvkN2HMOqKohz6kjlrU3KMrHVH3N20q3+PtlGfX2Vxec+cE4EcpRBhFae5S9V9RxeCBvgH3MWx2bmmexrd9rfQFJxcs7bzterhHdYAekwnacwXQBh5QoIw5QiUvWesaJ+gIEsT/x2WOBMJH3w1yrL8aECblYryfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddnIV5G+; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddnIV5G+"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70059e4dab6so927673eaf.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792145746; cv=none;
        d=google.com; s=arc-20260327;
        b=VzByteSsXlDQI5uW3mMAF1/iKsXN1sp+EFEhQFrf8pylG1/wyIWTmpCSyS+kJbsJeD
         JbpZYfR3NZLnf1hwIXIj2plVnlptj5LdkMwp0l/DddBZE0FO3D1semjKW6YTFkxkKYjv
         rjOzmEWWVKSNpbaWmcJVlYPVa9bIyPWV6E7x/A2Do5a89Xzpg8rFm6lvlZL+Xa7JFB+7
         dlbqt7Pg+al7MKSrbyz9xbxuz525UGV3WS0Y/fihqMu4ox9QQkcPgjSYPjx5MgZpjVAb
         TITxDukHW20L/fs4vtoc4iqtNArgYetiV97gKYom5nGrvfk0Rhsgd0IY0oglRmdJt1h9
         TrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixHThCS1DziF7jaaEn+F+nAUwwMRbRLnCSspBqixcY0=;
        fh=qZik4/VWjPDC2yNF7MZ5+UI33XCJmL66SSour34wK0I=;
        b=NHJgKPTNG6yvyQVownbYIxHLH9qmFFYUAoowTFhex26/MB6M9iCE85z1jxEe1df8Kt
         ugZt33Zykr/gmTx/7GrZU8m5o/aq8uSVetwwPZccarBhceZ/bO6XeL/s0A8BWTZIKytp
         KUZS0sGeg0fexNGD18ZnQ0VEzX5WiXt4dA7c43d7JcUqBHPBNjp+K5LRNorMojhD8daW
         7sl/GBKjb+jBVLrI1blQxHRpDeGj/jx5r3FHmqYD/Aonmnq0R1wEOuHnJ3J1y2/CrTWO
         oQ/jlcLGJ6P3v4IyiAkKw8Yo7LXsWSqxl+QbwC04qrNpOi+jPhR7m563BHCL63ugyiYB
         KpeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145746; x=1792750546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixHThCS1DziF7jaaEn+F+nAUwwMRbRLnCSspBqixcY0=;
        b=ddnIV5G+MPUuwl28rB68ANwYcwzAr7ZMB9Y4bpeNDcP37X6s5Ko+mbFVUA+LlPVhAl
         gng60D798KVW1mCeyC8PiMiVgLXZH0IvBWhqc5O+6Jbi82wfjJZ69uSwbb+tJD2bbqth
         DgzjnQEUVy6ZihuNUdjyaphal9JXOdrfq6vzMRwlJvMfH5YD8Xar8ecBdvnfNjOVZ96L
         wNgRPv6PQz4Sajx5JE9KALU9/UyyZhrlUUM1RySIug0vH+EsfXWj2Kj/O87CzOTBa6D6
         2ipOGU+2LRk3DUIe9uyd7YG1R1lxNpbIYx/Au4/SvRQNBXD14pSAAC6/ZKAlaJ5zD3Ar
         VKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145746; x=1792750546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixHThCS1DziF7jaaEn+F+nAUwwMRbRLnCSspBqixcY0=;
        b=qUu4s27AUTe8LvlLL5xhwiekYL9UH6QSPTemWyRbnmZ8Ll4phyHfnehialvhYsF3WD
         nywMXMLvflgTcHu2Fs5WSFyqilncWCONM4Q/WsnJkpZHBZcR8Kmf0vOO1HG6SuX73FdP
         GfZMT2qJ3Hzxe0URFDzM/y3L8vF0/Il1C4+rvSQ+49tfJ5AebKer0fa+ZQq1I6jhHYJN
         CGSYtF9JV4wsWTWaRMe7oCLgV/m0U04DmCuMM+8qK4xrfTLVj2oquMawZ/i/ehnoALRi
         SYFmbKEuKBLGDHb/umvByhsFlJR5lQ1OCgVE0YlEmFk0jBwDRP8aW6mB26Yah6bolNgs
         9p4A==
X-Forwarded-Encrypted: i=1; AKwUvBznBIp+Q0q0QkJkgz1XJZCt8XjEn0f0Vniq7XbhoWQWcJApd/hYW12yG8uQCWC4ujauD8pykxFpOAwC7g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJcuLFZumjPWop4oo7aDuNA64pUroJh+NW5UpjRFcfeBEDIKhzN
	wtwX21I7fmmwCjXgDfMSAm6aajK4hXvTyiw3vWLmuDbBVVgkcZjb40cpxONwbtjx8E/1SpRRGdU
	/4zPYoZBaf8L9sYDLuYxAbQ62w3GSa/Y=
X-Gm-Gg: AYBFou12QlK3cv8aE/lxGXAi4ItcefZqtea2OsUBsJL6SNL8nIqZCO+8gifYHkVcC7p
	YWXWp0nb/PxVZwtk2i0F0qNZtrODqP06aBkTTV9u0Z3QYhdIumPir7UZrxseom4qzDUw1qL3HGR
	Q6CcEUxGNYPLsLTSbqEY20GNsesa7u9OCH22vY95TeKvS+4lIUGUr4LmRZFzqjMBtRWQ3KeIaOb
	HZ9IASQhzTNdn/SVTJRGMH0sOMQXTxY0DlHzAEU2YxwYKgVX5CbdA/UxR63lUdrmPm50jXt2piY
	GGITideAQ0aEzC/uf5I2UoKJ5jtetz0D8XQTKOpP5BeBUpyeGBUqTV9p9hQW5GyGsQ3A9eM45sB
	cCamhEWojR+6r7mvce0d2YsCqeY74ygr5XUq0g1Ss/Q==
X-Received: by 2002:a05:6820:1382:b0:702:af73:be5e with SMTP id
 006d021491bc7-702af73bee0mr327002eaf.37.1792145745743; Fri, 16 Oct 2026
 03:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003184217.34671-1-mikhail.v.gavrilov@gmail.com> <65584p23-91oo-r3o9-84po-7r7679278pn8@xreary.bet>
In-Reply-To: <65584p23-91oo-r3o9-84po-7r7679278pn8@xreary.bet>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 16 Oct 2026 15:15:33 +0500
X-Gm-Features: AclHuK_jxLyvBoyWgfXad4Q9KbjUS7aENODGbRm3o0iIJWM09iFwu7vz4AngPWA
Message-ID: <CABXGCsNRqYPtKFMtmcREH+Dti_wSRCBb9iCSEg86zVBJO5acyA@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] the Topping M62's vendor controls, on the
 component framework
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, tiwai@suse.de, tiwai@suse.com, perex@perex.cz, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 2:50=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> Acked-by: Jiri Kosina <jkosina@suse.com>
>
> Takashi, will you take the whole lot through alsa tree?
>

Thank you, Jiri.

Takashi, please hold off on v8: v9 goes out tomorrow and replaces it.
Its 1/8 is v8's 1/2 unchanged and carries Jiri's ack. Its 2/8 is v8's
2/2 with changes a user would see:

  - v8 treats the M62's Mobile Mode as Pro Audio Mode and writes, at
    the first bind, two output selectors that Mobile Mode does not
    have; v9 reads the mode from bcdDevice;
  - in v8 an input gain the card has not reported reads 0, which
    alsactl stores and writes back at the next connect, muting AUX, BT
    and OTG IN; v9 writes every input gain at the first bind;
  - "Mic-1" and "Mic-2" become "Mic1" and "Mic2", as every other
    control name in the tree has it and as the M62's UCM profile
    already uses them.

The other six add the E2x2 OTG, the M62's battery level and port power
settings, and both cards' MUTEs. Two of them, 3/8 and 5/8, are HID, so
they will need your look as well, Jiri.

--=20
Thanks,
Mikhail.
