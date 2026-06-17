Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1618BBAE
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781664451; cv=pass; b=cJoZXoP0D6kUIC+SK6moItnR6mmajR3r03dlXAMgzNhvraYIkL8sMYTU0vG27Hr7440tg7cmSQbeAME1K0TBMq/GuYQTcvb3R9jgnjcLwCpEeTGPGOLdHjz3skGSCmWNdTMefYraZHgHJNYUHbtTKoxN3LSO1GIOQFigYNMI9bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781664451; c=relaxed/simple;
	bh=21CVZQDbTAMe89ajgAnXDUlzqVCUT7uwZY3Vs9iAWO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWK5jz3feJHjVfjQcnEDG70KMVflXC3cMJtKLPrlxI2lugZa6OuZDimAN0omfXjdeIBz13055MvB4WTLYbPmkDIB34UGoCocOVX7PQ0sq1A6/rkYlZwfiVuf4GmHBWecxSgiyKk1NuoNeDJmSSWRlxEQKcB5EwJK9HEaIlwKAwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMFNk4Rn; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMFNk4Rn"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so3195187a12.0
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 19:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781664450; cv=none;
        d=google.com; s=arc-20240605;
        b=BWm6bGMegINTTWVdTj0PlNQ4rgfEZ8mVjmknyY5/wUOi+yQrj+/MBcsY3wBjmW6vhq
         AH9S8bTOszalZgZa+dbRdDss4ze8CwHxVBzWHlTnDRFz84SSp09+salV1HdvflAPpI6p
         OeqKB2hWB8XgiPgtUtQ0CGYhrNPJbIK0XsZ30kmFxsafJCkrXESqt/rxclCyd/m7aOZa
         3Wfn1OngIGvysCEKXy84jn7p2CkTpaLVj2mV0IsbIY3hRDFDSEgeqp85UKQrNjO1vY+B
         Kr0Bh6Sx0XVCzV+JQRhRy3P/kcL2Uz4cPegKfom50nwQz23JlUoYf4lmxXUmaZ+gnnY1
         YA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=21CVZQDbTAMe89ajgAnXDUlzqVCUT7uwZY3Vs9iAWO0=;
        fh=lPY9mPL6Jt1KlpveQLe0BkAvzgAhHKgODDQZXIFxeVI=;
        b=WSaUFnuXK5kfQUdbainOac9fRRdDSyXMb/UHmyWL1u3AK2f4f3sXYP5wJDZHcofp8/
         UIf9PMU0jKcOHVbjJZ4m9PUosxJIHS83oNTu6aGNxXLtCIpaotoJp4W3HklQFlC7degp
         WvjtELZnlYaoBaIBvPzml1s3Jfcn5ZG3zWtSvN8b0hQuX7mJ6sAsWtsvomIrhBMMngw1
         3GUvrdAzeu1V19e6xVxvnlJxnQy1I0LULoz3vZ+gZ+wWC3UCeVVL9dLCaKsvZGIl0tV9
         fiBdLFrh1VZ5JknsnAOxIfU6cJMLJnIpjckfRO7Ng/khjjCw4Va2SgkwQPDqKII8LuPD
         EC0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781664450; x=1782269250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21CVZQDbTAMe89ajgAnXDUlzqVCUT7uwZY3Vs9iAWO0=;
        b=MMFNk4RndWI8nSrKz3JC1jF+E2lQ7/fuwLvgvfNRnxTCUehHi97eEac/X7Dszge/Qp
         BHEVDj1JCU58V06/2Aj1ZtQXGhGjhpeKhj4giCawHRHDNlaa5ACqnwwpxiQ0pGArT/B0
         vub0QuH3gEIkRJDB/FCnzj0DlO3XObtXsTiqaET2xUeqlYHKLuB9+ab5g0K2tjQWCixY
         QuYxP3hKpMDb1tpCRZOoDAYQgIqfOGF5bczD6qPKaxjAKkp+J0btHgiYMzvs9dw7zu/Z
         994VbLC+vsYC1lit1TD7sEnQu2RQqAL4o/jALUJW7vzQeiQhFeE/Hz6QlQzBXgw7Wc3C
         vkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781664450; x=1782269250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21CVZQDbTAMe89ajgAnXDUlzqVCUT7uwZY3Vs9iAWO0=;
        b=jdhVLachMXTMPLgD6Vg+J4Tz+byQf+vVXHOZtw7rWONo1D2iVWD4zvnzhLbnMw2dzt
         gbD+1+L0SQo40xzMdOCFdMSqaV0BailI/BJVwXPfyzTe6S6b5RbhanCD6SgS4whFp3UT
         J5Jx50gWWOZR8zSpVOGELvY9+2JrZtxpJduZD2kc0lkTHrQ027FIamUzXk9ZHkcIQIPy
         slGrBhAl81j61Gx84xJWhV/lK78Gh+n2B6yQh/oZhaOdMaj/IBsnqGuMrMh/lHeZHbJ4
         AQPGrNw1oWaZnLP7oq8IO+UyFIJ5Wg1K3UY3oTN/n42bgfJB6R+mAI7/Ar6G+MBZj1As
         ZLuA==
X-Forwarded-Encrypted: i=1; AFNElJ9aQopuBUa5Z7no0vk/TovU3vowKrURF6arZEOos02xj9ke2NAB8JCfPHD7J9a5MTvR8q9AHQvXtHqjZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5VAF3/5VjXZNVm9SjpfPG/34PiymQuTHesGfaPwGgV+tCB4GN
	cdB/mYad2TK3zL6Yxgutn7f1tFimr4/CayE2eNfWBw9vvOb5FgqMmAqgS8H20YcKbsDeDLsahUx
	xCKxui/8eXsfz1EymJFTROA91U69+kRg=
X-Gm-Gg: Acq92OHTr7XLsI6xmeNNoSvhN6CtuHbqkJODJVf51TX3iEpfNcVtcRh+P80H8jK6P0s
	9fDIJ0F9KtVFTYAy/GyaYy9kNfOkhXqggf9htgSA6E9V6kPBDrCutc58Zp0Ow8Mo2KzcBeqvJXB
	OltZ2U3PsLFnvbkJd9Tq9JuXd15POzSClj97kcBy3+PHD1IeYc4CajJ6DWdQypJLQNugfqivx3N
	j+wGybM2hasq1D2mqZG1xvO4yX8FYbJMejwgAZOTzLS5z9cBxH3dS0OgVq0T96a80G4klmzQJAc
	bs1y6/7OfBfhObfvo1VHyztX2ec=
X-Received: by 2002:a05:6a20:9f44:b0:3b4:8f18:326 with SMTP id
 adf61e73a8af0-3b8bcc8b463mr2012630637.10.1781664450337; Tue, 16 Jun 2026
 19:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611115901.80438-1-phucduc.bui@gmail.com> <20260611115901.80438-5-phucduc.bui@gmail.com>
 <8bf70242-a64a-4980-90b0-ab0310685a7b@intel.com> <CAABR9nGVKMJjCOQ1S72HR6iAS8Sx+wDT3L0tNyvn2AaAdhWodw@mail.gmail.com>
 <9bb2bc5e-507c-4a73-ae44-dff6659fae93@intel.com>
In-Reply-To: <9bb2bc5e-507c-4a73-ae44-dff6659fae93@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 17 Jun 2026 09:47:19 +0700
X-Gm-Features: AVVi8Ceh3jemIwtDTJTZ0WpoOLM58Ai98wo2lgUTHl7-KaGEEF_Oqoh9qu-lRIY
Message-ID: <CAABR9nE9LvA0TJ4GxpTvxpENAZ7r2Aa3_GaVZdMty64YW02Z4g@mail.gmail.com>
Subject: Re: [PATCH 04/20] ASoC: Intel: avs: probes: Use guard() for spin locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I see your point.

> 3. leave guard() as is. As I mentioned, guard() carries no readability
> cost what cannot be said about its scoped_guard() friend.

Personally, I find it a bit inconsistent when guard()-based locking
and the traditional lock/unlock style are mixed within the same driver
or file.
Once I'm familiar with the syntax, I find scoped_guard() reasonably
readable as well.

That said, this is Intel ASoC code and you're maintaining this area,
so I'm happy to follow your preferred approach for v2.

Best regards,
Phuc
