From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Date: Wed, 21 Mar 2001 10:33:41 +0000
Subject: Re: 2.4.x kernel: es1371 driver
Message-Id: <marc-linux-sound-98517094603374@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-98511855415300@msgid-missing>
In-Reply-To: <marc-linux-sound-98511855415300@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> as your adress sailer@ife.ee.ethz.ch (from 2.4.2-ac20) seems to be wrong, I

No it is correct

> the module seems to accept the "joystick=" option. Is this intentional? The

In the quite near future, the idea is that the es1371 driver finds a
free
address and communicates it to the joystick driver automatically, so no
user intervention will be needed...

Tom
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
