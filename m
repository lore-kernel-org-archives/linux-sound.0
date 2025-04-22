Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9885E28BA93
	for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332325; cv=none; b=aLAhWiGaQLP77oEfvfu5XY7pwb7ZrkYKB55+t/JJfjaG7Xtrnu+YkWCPAKnEvCBUEABuZYpd8WsmGatQTSk7lxMMVcwFUooPDmnvLs/3sGMB/u31Bo7cqsR+S8beUn2ogwn3B0hoZLI2Yp69Z2mRg71oCxvY/xYLX1ENgGcHlGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332325; c=relaxed/simple;
	bh=DaHIxoXcrK5LE1Zn/Tcv8xMy56Zvw+eVARZOJaHiAjk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HVcEuoHMyWy3+DVDXxSXdu7nEqP0jcRjcccQpsFzcHoHV2LiW/XIiq0PH3SGS1L8j5ppk6Arjq2CXrjloRKZknMNISQ+Htjhzz0do8AH5dpwAmVxF9J76XhA9C0hAkxVwRNsTcYOpLpiLQoaC1BP+hKC0wwGpPVBLraCIlEiLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=tr0RfccK; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="tr0RfccK"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2c76a1b574cso1536941fac.2
        for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1745332322; x=1745937122; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fjpNLaowsthRQqQGVXf2RlcWS0SXicvav99T5Osk10M=;
        b=tr0RfccK/ImgLr/FxzuRFQzMfCLNQzO9czCI6N8rAxMXnlaw6PfGyt8HW8BPXQjVHz
         xqnk4MDM6jQB8lua/l7/8hmJgcyQ1W6BwQ5VpkZNomCifA9WkAxmG9fb2qyj4smqO4rW
         jz5DPYeUNKZWXVJ4yoG6i4fylbZFOTJ48C6vJMfzmomfasGSEoqvoHILhCkLZGMvn0dH
         UR/hkJoLuu7vc3faSzqS4iWQ+5cc8/Cd7R6STynguIAz1SKZ9PPg/MNtxq8x6IYWe5FB
         fpnHtPfF0DaLHozf7G2j3oO/4cnN+WKcUuVPvo//yBFKZJtdS6j7pg/IMofWkmYyr8ZC
         Tdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332322; x=1745937122;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjpNLaowsthRQqQGVXf2RlcWS0SXicvav99T5Osk10M=;
        b=t7mSOYuUtjNUZUPMm0mPc/nNYvgr8UTPP6/XK0kk7PwI7ETR9zcS25R6XoyK5FgdNZ
         yNZjVY6aEJKTJlFtCoxXiwIF8D6LnJZgx7VfqeozTQCJFxj3br5MH05B7JgYjsz8Yf/p
         PhAUzAwl7Rj9v1qqTlspIPIjqLmsfNySaYYU101lD5eaM1IB28rrew8VtpZWACwMkxSK
         1BIbCV3COwDSikOG6ojvNL3flKSwEZ0cY2Ai74uIwG9loyuISiHdtfDW0f+fQ5Pgcroi
         zksgmK6xpktUqbzGU1FGRqAWZhucHUgqOTU6G3eCdvSFY8M3bOVXr6sT+iN5Dipy/tun
         WfEw==
X-Gm-Message-State: AOJu0YxvpVzAALXPgp+vbRzGWGjev3D+7ZXjfaCy50L6fTS5CuZx9gou
	Inz9GM6bNwiWQb2FjeYHnoyrYook1AThPYA/tT8XrxXeOGvo3v9F0rOWiA52IJY4kFzdViaVht/
	eHw0Cue+is3hI84mx74DuD+l/dVTGw1P03xgv+6FAXOjSxEeU7w==
X-Gm-Gg: ASbGncv74hR+ZMjizoERpgPcQxHn+8ZhZ06lZOe3Dri+XzDr3TUUTkE8AF2Fj3AVlQK
	RXXRwO0GQhgz6uToDPt1HY+DBXiDcSrfKDdmW/sC4HUOssfv8n0rwwu1DnTKisrRcnwh+nyKtYj
	14VTTN3VTqOEdvtHd+EhlP4w==
X-Google-Smtp-Source: AGHT+IGbxvXcXF7923PGC3oo4CJh1MJcRPZnoCgXYN9cEo9crceMA24Rviaup8H4H7cspIZe/e3D1YEvmZeNUbPLQ90=
X-Received: by 2002:a05:6870:e998:b0:2d4:e101:13eb with SMTP id
 586e51a60fabf-2d526e67af7mr10459283fac.28.1745332322238; Tue, 22 Apr 2025
 07:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Paul Davis <paul@linuxaudiosystems.com>
Date: Tue, 22 Apr 2025 08:31:50 -0600
X-Gm-Features: ATxdqUEoLY6fakNBzRsk1OTKaA3G3RAMCo8fyYXSuTToxuaEiGvUV8qFum3qnpk
Message-ID: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
Subject: ALSA USB MIDI port names are poorly constructed and truncate iJACK names
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ALSA's USB MIDI support appears to construct MIDI port names by
concatenating the iProduct name and the iJACK name. The problem with
this is that there is a fixed length to the port name in ALSA, and for
an increasing number of devices, this behavior truncates critical
information from the end of the iJACK name.

For example, culled from lsusb output:

Bus 005 Device 098: ID 1235:0145 Focusrite-Novation Launchkey MK4 49
  iProduct                2 Launchkey MK4 49
    iConfiguration          4 Launchkey MK4 49
      iInterface              5 Launchkey MK4 49 MIDI
      iInterface              6 Launchkey MK4 49 MIDI Int
        iJack                   7 Launchkey MK4 49 MIDI In
        iJack                   8 Launchkey MK4 49 MIDI Out
        iJack                   9 Launchkey MK4 49 DAW In

gives these port names:

44:0    Launchkey MK4 49                 Launchkey MK4 49 Launchkey MK4
 44:1    Launchkey MK4 49                 Launchkey MK4 49 Launchkey MK4

which is useless since it fails to include the "DAW" and "MIDI Out"
parts of the iJACK names.

The correct fix, I think is to only prepend the iProduct name if that
name is not present at the start of the iJACK name. This will cover
devices where the manufacturer does *not* include the device name in
the iJACK name, but will fix this situation for devices where they do
(Novation and Arturia and many others do this).

If agreed, I can construct a patch for this.
